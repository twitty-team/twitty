class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  force_ssl if: :ssl_configured?

  def current_user
    _current_user if session[:user_id]
  end

  def _current_user
    @_current_user ||= User.find(session[:user_id])
  end

  private

  def ssl_configured?
    Rails.env.production?
  end
end
