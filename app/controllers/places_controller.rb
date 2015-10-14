class PlacesController < ApplicationController

  # Google places text search URI
  TEXT_API_URI = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

  NEARBY_API_URI = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"

  SALT_LAKE = "40.7500 N, 111.8833 W"

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
    city = City.find(params[:city].to_i)
    city = city.name


    response = call_google(city) #method call

    # places = Place.where(city_id: params[:id])

    if response != nil
      render json: response.as_json, status: 200
    else
      render json: { error: "No places were returned for the given city" }, status: 404
    end
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

  def call_google(city)
    response = HTTParty.get(NEARBY_API_URI + "location=" + SALT_LAKE + "&radius=2500" + "&types=amusement_park|aquarium|art_gallery|bakery|bar|beauty_salon|book_store|bowling_alley|cafe|campground|cemetery|city_hall|clothing_store|department_store|florist|food|furniture_store|grocery_or_supermarket|gym|hindu_temple|home_goods_store|jewelry_store|library|liquor_store|mosque|movie_theater|museum|night_club|park|place_of_worship|restaurant|shoe_store|shopping_mall|spa|stadium|university|zoo" + "&key=" + KEY)
  end
end
