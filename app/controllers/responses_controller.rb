class ResponsesController < ApplicationController
  before_action :current_user

  def new
    @places = Place.where(city_id: @current_user.city_id)
    @response = Response.new
  end

  def create
    response = Response.create(
      response: params[:response][:response],
      place_id: params[:place_id],
      question_id: params[:question_id],
      user_id:  @current_user.id)

    redirect_to home_path
  end

  private

  def response_params
    params.require(:response).permit(:response, :place_id, :user_id, :question_id)

  end
end
