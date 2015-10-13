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

    categories_update(place) # method call to associate categories

    if place.save
      render json: place.as_json, status: 200
    else
      render json: { message: "Place updates could not be saved" }
    end
  end

# This does not yet consider a person's preferences
  def find_by_city
    places = Place.where(city_id: params[:id])

    render json: places.as_json, status: 200
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

end
