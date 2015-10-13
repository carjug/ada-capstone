class UsersController < ApplicationController

  # POST /register
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: 200
    else
      render json: { error: "Could not create user" }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
