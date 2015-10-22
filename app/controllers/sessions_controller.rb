class SessionsController < ApplicationController
  before_action :current_user
  def new

  end

  def index

  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      @user = user
      redirect_to '/'
    else
      flash.now[:login_error] = "Login failed. Try again."

      render :new
    end
  end
end
