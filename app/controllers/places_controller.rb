class PlacesController < ApplicationController

  def create
    place = Place.new(place_params)

    if place.save
      render json: place.as_json, status: 200
    else
      render json: { message: "Place could not be saved" }
    end
  end

# This does not yet consider a person's place preferences
  def find_by_city
    places = Place.where(city_id: params[:id])

    render json: places.as_json, status: 200
  end

  private

  def place_params
    params.require(:place).permit(:name, :city_id, :categories)
  end
end
