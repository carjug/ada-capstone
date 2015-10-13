class PlacesController < ApplicationController

  def find_by_city
    places = Place.where(city_id: params[:id])

    render json: places.as_json, status: 200
  end
end
