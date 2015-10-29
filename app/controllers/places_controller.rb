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
                limit: 2}
      resp  = Yelp.client.search(city.name, params) # method call to client
      regex = /biz\/(\S*)/
      biz   = regex.match(resp.businesses[0].url)
      final_resp = Yelp.client.business(biz[1]) # method call to client

      all.push([final_resp] + [{place: place.name}])
    end
    format_data(all)
  end

  def format_data(response)
    final_format = []
    response.each do |place|
      place2 = Place.find_by('name LIKE ?', place[1][:place])
      rec    = current_user.user_recommendations.find_by('place_id = ?', place2.id)
      img    = place[0].business.image_url.gsub!('/ms.jpg', '/l.jpg')
      img    = img.gsub!('http:', 'https:')

      final_format.push(
        {
          rank: rec.rank,
          score: rec.score,
          name: place[0].business.name,
          url: place[0].business.url,
          image_url: img,
          location: place[0].business.location.display_address
        })
    end
    return final_format
  end

end
