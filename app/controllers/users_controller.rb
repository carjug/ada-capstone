class UsersController < ApplicationController

  # POST /api/register
  def create
    user = User.new(user_params)

    if user.save
      # put this in when sessions work -- also do I need this for a reactJs fron tend?
      # session[:user_id] = user.user_id
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
