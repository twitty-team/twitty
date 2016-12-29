class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    _current_user if session[:user_id]
  end

  def _current_user
    @_current_user ||= User.find(session[:user_id])
  end
end
