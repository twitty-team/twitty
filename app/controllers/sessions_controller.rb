class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to tweets_path
    end
    @user = User.new
  end

  def create
    user = User.find_by(name: user_params[:name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to tweets_path
    else
      redirect_to new_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_login_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end
end
