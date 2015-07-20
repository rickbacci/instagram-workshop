class SessionsController < ApplicationController
  def create
    if @user = User.find_or_create_from_oauth(oauth)
      session[:user_id] = @user.uid
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def oauth
      request.env["omniauth.auth"]
    end
end
