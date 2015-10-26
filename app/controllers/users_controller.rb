class UsersController < ApplicationController
  before_action :current_user, :authorize, only: :profile

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

    if user.save!
      session[:user_id] = user.id
      redirect_to new_response_path
    else
      flash[:register_error] = "Registration failed, try again."
      redirect_to login_path
    end
  end

  def profile
    my_places = Place.places_user_has_rated(@current_user)

    @my_places = my_places.sort_by { |place| place.name }
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :city_id)
  end
end
