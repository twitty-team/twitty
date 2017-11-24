class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login?

  def current_user
    _current_user if session[:user_id]
  end

  private

  def require_login
    return redirect_to(new_login_path) unless login?
  end

  def login?
    return true if current_user
    false
  end

  def _current_user
    @_current_user ||= User.find(session[:user_id])
  end
end
