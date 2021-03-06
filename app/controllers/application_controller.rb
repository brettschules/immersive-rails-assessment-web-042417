class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    unless !!current_user
      flash[:error] = "You must be logged in!"
      redirect_to root_path
    end
  end
end
