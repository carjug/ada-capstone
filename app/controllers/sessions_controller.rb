class SessionsController < ApplicationController

  def new

  end

  def index

  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash.now[:errors] = "Login failed. Try again."

      render :new
    end
  end
end
