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
      redirect_to new_user_detail_path
    else
      redirect_to root_url
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(set_params)
      redirect_to user_path(user.id)
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
  end
  
  
  
  
  private
  
  def set_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
  
end
