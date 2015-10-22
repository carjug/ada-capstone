class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_user
  helper_method :current_user

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

end
