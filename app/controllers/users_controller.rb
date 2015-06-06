class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to user_path(user.id)
    else
      render action: 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = USer.find(params[:id])
    if @user.update_attributes(set_params)
      redirect_to user_path(user.id)
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  private
  
  def set_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
  
end
