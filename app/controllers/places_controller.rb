class PlacesController < ApplicationController
  before_action :current_user, :authorize

  GOOGLE_URI = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
  GOOGLE_KEY = ENV["GOOGLE_KEY"]

  def new
    @place = Place.new
    @place_types = PlaceType.where('id > 1')
    @response = Response.new
  end

  def search
    city     = City.find_by(name: params[:city][:city])
    response = call_google(city)

    @other_places       = create_places(response["results"])
    @recommended_places = @current_user.user_recommendations
  end

  def create
    city          = City.find_by(name: params[:place][:city])
    place         = Place.new(place_params)
    place.city_id = city.id
    place.save!

    response             = Response.new
    response.response    = params[:response]
    response.place_id    = place.id
    response.user_id     = @current_user.id
    response.question_id = params[:question_id]
    response.save!

    redirect_to home_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :city_id, :categories)
  end

  def response_params
    params.require(:response).permit(:response, :place_id, :user_id, :question_id)
  end

  def call_google(city)
    response = HTTParty.get(GOOGLE_URI + "location=" + city.lat_long + "&radius=10000&types=bar|liquor_store|food|cafe|park" + "&key=" + GOOGLE_KEY )
  end

  def create_places(data)
    places = data.map do |d|
      Place.create(
        name: d["name"]
      )
    end
  end
end
