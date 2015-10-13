class SessionsController < ApplicationController

  def create
    user = User.find(params[:user][:id])

    if user.authenticate(params[:user][:password]) != false
      session[:user_id] = user.id
      render json: { message: "Login successful" }, status: 200
    else
      render json: { error: "Login unsuccessful" }, status: 400
    end
  end

end
