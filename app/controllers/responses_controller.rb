class ResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user, :authorize

  def new
    @places = Place.where(city_id: @current_user.city_id)
    @response = Response.new
  end

  def create
    response = Response.new(response_params)

    response.response = params[:response][:response]
    response.user_id  = @current_user.id
    response.save!

    redirect_to home_path
  end

  def edit
    @place_response = current_user.responses.find(params[:id])
    @place_name = Place.find(@place_response.place_id).name
  end

  def update
    response = current_user.responses.find(params[:id])
    response.update(response: params[:response])

    redirect_to profile_path
  end

  private

  def response_params
    params.require(:response).permit(:response, :place_id, :user_id, :question_id)

  end
end
