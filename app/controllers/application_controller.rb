class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :current_user
  helper_method :current_user


  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def authorize
    redirect_to '/login' unless current_user
  end

end
