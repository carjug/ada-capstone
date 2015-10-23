class PlacesController < ApplicationController
  before_action :current_user, :authorize

  def new
    @place = Place.new
    @place_types = PlaceType.where('id > 1')
    @response = Response.new
  end

  def search
    city = City.find_by(name: params[:city][:city])

    @places = @current_user.user_recommendations
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

  def update
    place = Place.find(params[:id])

    place.update(name: params[:name])

    categories_update(place) # method call
  end

  private

  def place_params
    params.require(:place).permit(:name, :city_id, :categories)
  end

  def response_params
    params.require(:response).permit(:response, :place_id, :user_id, :question_id)
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
