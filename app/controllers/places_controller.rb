class PlacesController < ApplicationController

  # Google places text search URI
  TEXT_API_URI = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

  NEARBY_API_URI = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"

  SALT_LAKE = "40.758701, -111.876183"

  KEY = ENV["GOOGLE_KEY"]

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

    categories_update(place) # method call to associate categories

    if place.save
      render json: place.as_json, status: 200
    else
      render json: { message: "Place updates could not be saved" }
    end
  end

# This does not yet consider a person's preferences

  def find_by_city
    # city = City.find(params[:city].to_i)
    # city = city.name

    # response = call_google(city) # method call
    # create_places(response) # method call

    places = Place.where(city_id: params[:city])
    places = format_data(places)

    places.empty? ? status = :no_content : status = :ok

    render json: places.as_json, status: status
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

  # Below are currently useless methods


  def call_google(city)
    response_array = []
    response1 = HTTParty.get(NEARBY_API_URI + "location=" + SALT_LAKE + "&radius=10000" + "&rankby=prominence" + "&types=amusement_park|aquarium|art_gallery|bakery|bar|beauty_salon|book_store|bowling_alley|cafe|campground|cemetery|city_hall|clothing_store|department_store|florist|food|furniture_store|grocery_or_supermarket|gym|hindu_temple|home_goods_store|jewelry_store|library|liquor_store|mosque|movie_theater|museum|night_club|park|place_of_worship|restaurant|shoe_store|shopping_mall|spa|stadium|university|zoo" + "&key=" + KEY)
    response_array.push(response1)

    if response1["next_page_token"] != nil
      page_token = response1["next_page_token"]
      response2 = HTTParty.get(NEARBY_API_URI + "pagetoken=" + page_token + "&key=" + KEY)

      if response2["status"] == "INVALID_REQUEST"
        response3 = HTTParty.get(NEARBY_API_URI + "pagetoken=" + page_token + "&key=" + KEY)
      else
        response_array.push(response2)
        response_array.push(response3)
      end
    end
    return response_array
  end

  def create_places(response)
    data = response[0].body
    data = JSON.parse(data)
    name_count = 0
    data["results"].each do |place|
      print place["name"]
      name_count += 1
    end
    print("NAME COUNT = ", name_count) # for testing
  end
end
