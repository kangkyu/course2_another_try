class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  # makes controller method use also in view template

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   
    # otherwise find(nil)
  end
  # memorization (minor performance optimization)
  # cases call multiple times in one template, hit db once

  def logged_in?
    !!current_user  # makes it true or false only
  end

  def require_user
    if !logged_in?
      redirect_to root_path
    end
  end
end
