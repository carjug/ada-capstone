class CitiesController < ApplicationController

  def create
    city = City.new(city_params)

    if city.save
      render json: city.as_json, status: 200
    else
      render json: { message: "City could not be saved" }, status: 401
    end
  end

  def update
    city = City.find(params[:id])

    city.update(name: params[:name])

    places_update(city) # method call to associate places

    if city.save
      render json: city.as_json, status: 200
    else
      render json: { message: "Place updates could not be saved" }, status: 401
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :prov_id, :places)
  end

  def places_update(city)
    new_places = params[:places]

    new_places.each do |place|
      if !place.empty?
        city.places << Place.find(place)
      end
    end
  end

end
