class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user, :authorize, only: [:home]

  def home

  end

  def new

  end

  def index

  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash.now[:login_error] = "Login failed. Try again."

      render :new
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to home_path
  end
end
