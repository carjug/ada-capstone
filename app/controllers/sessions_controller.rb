class SessionsController < ApplicationController

  def create
    begin
      user = User.find_by(username: params[:username])

      user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = user.id

      render json: { user: user.username, token: user.password_digest, status: 200 }
    rescue
      render json: { error: "Login unsuccessful" }, status: 400
    end
  end
end
