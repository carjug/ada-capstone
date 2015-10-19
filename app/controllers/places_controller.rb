class PlacesController < ApplicationController

  def create
    place = Place.new(place_params)

    if place.save
      render json: place.as_json, status: 200
    else
      render json: { message: "Place could not be saved" }
    end
  end

  def update
    place = Place.find(params[:id])

    place.update(name: params[:name])

    categories_update(place) # method call

    if place.save
      render json: place.as_json, status: 200
    else
      render json: { message: "Place updates could not be saved" }
    end
  end


  def find_by_city
    begin
      city   = City.find_by(name: params[:city])
      places = Place.places_by_city(city)
      places = format_data(places) # method call

      places.empty? ? status = :no_content : status = :ok
    rescue
      places = {}
      status = :no_content
    end
    render json: places.as_json, status: status
  end

# This does not yet consider a person's preferences
  def find_by_city_and_preferences
    # get user similarity index either to other users that have rated places in the city of interest
    # ^ can be done with the concept of cultures

    # or find places with high similarity to user's highly rated places
    # ^ how to do this is the question -- maybe using categories?!
    # or both!

  end

  private

  def place_params
    params.require(:place).permit(:name, :city_id, :categories)
  end

  def categories_update(place)
    new_categories = params[:categories]

    new_categories.each do |cat|
      if !cat.empty?
        place.categories << Category.find(cat)
      end
    end
  end

  def format_data(response)
    city    = City.find(response[0].city_id)
    prov    = Prov.find(city.prov_id)
    country = Country.find(prov.country_id)

    response.map do |place|
     {
        name: place.name,
        place_type: place.place_type_id || "",
        city: {
          name: city.name
        },
        prov: {
          name: prov.name,
          abbreviation: prov.abbreviation
        },
        country: {
          name: country.name,
          code: country.code
        }
      }
    end
  end

end
