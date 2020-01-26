class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  helper_method :current_user
  helper_method :current_user_calendar
  before_action :login_required

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user_calendar
    @current_user_calendar = User.first
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
