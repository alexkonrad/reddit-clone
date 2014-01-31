class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(
      params[:user][:username]
    )
    
    if user && user.is_password?(params[:user][:password])
      redirect_to links_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end