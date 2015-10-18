class UsersController < ApplicationController

  # POST /register
  def create
    begin
      user = User.new(
        email: params[:email],
        username: params[:username],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
        )
      user.save!
      session[:user_id] = user.id
      status = :ok
    rescue
      user = {}
      status = 400
    end
    render json: user, status: status
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
