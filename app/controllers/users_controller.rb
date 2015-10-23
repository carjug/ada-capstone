class UsersController < ApplicationController

  def new
    render :register
  end

  def create
    city = City.find_by(name: params[:user][:city])

    user = User.new(
      email: params[:user][:email],
      username: params[:user][:username],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      city_id: city.id)
    user.save!

    session[:user_id] = user.id

    redirect_to new_response_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :city_id)
  end
end
