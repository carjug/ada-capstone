require 'yelp_client'

class PlacesController < ApplicationController
  before_action :current_user, :authorize

  def new
    @place = Place.new
    @place_types = PlaceType.where('id > 1')
    @response = Response.new
  end

  def search
    city     = City.find_by(name: params[:city][:city])

    recs = @current_user.user_recommendations.where('city_id = ?', city.id)
    places = get_places(recs)
    @response = call_yelp(places, city)
    raise
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

  def get_places(recommendations)
    recommendations.map do |rec|
      Place.find(rec.place_id)
    end
  end

  def call_yelp(collection, city)
    all = []
    collection.each do |place|
      params = {term: place.name,
                limit: 1}
      resp  = Yelp.client.search(city.name, params)
      regex = /biz\/(\S*)/
      biz   = regex.match(resp.businesses[0].url)

      all << final_resp = Yelp.client.business(biz[1])
    end
    format_data(all)
  end

  def format_data(response)
    final_format = []
    response.each do |place|
      place2 = Place.find_by(name: place.business.name)
      rec = current_user.user_recommendations.find_by('place_id = ?', place2.id)
      final_format.push(
        {
          rank: rec.rank,
          score: rec.score,
          name: place.business.name,
          url: place.business.url,
          image_url: place.business.image_url,
          location: place.business.location.display_address
        })
    end
    return final_format
  end

end
