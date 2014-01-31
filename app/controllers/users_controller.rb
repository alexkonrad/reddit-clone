class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(username: params[:user][:username])
    @user.password = params[:user][:password]
    
    if @user.save
      sign_in(@user)
      redirect_to links_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to links_url
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
