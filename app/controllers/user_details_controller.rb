class UserDetailsController < ApplicationController
  
  def index
  end
  
  def new
    @user_detail = UserDetail.new
    
  end
  
  def create
    @user = current_user
    @user_detail = UserDetail.new(set_params)
    @user_detail.marital_status = params[:user_detail][:marital_status]
    @user_detail.smoking = params[:user_detail][:smoking]
    @user_detail.drinking = params[:user_detail][:drinking]
    @user_detail.diet = params[:user_detail][:diet]
    @user_detail.exercise = params[:user_detail][:exercise]
    @user_detail.family_history = params[:user_detail][:family_history]
    @user_detail.user_id = current_user.id
    if @user_detail.save
      redirect_to user_detail_path(@user_detail.id)
    end
  end

  def show
    @user_detail = UserDetail.find(params[:id])
  end
  
  def edit
    @user_detail = UserDetail.find(params[:id])
  end
  
  def update
    @user_detail = UserDeatil.find(params[:id])
    if @user_detail.update_attributes(set_params)
      redirect_to user_detail_path(current_user)
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @user_detail = UserDetail.find(params[:id])
    @user_detail.destroy
    redirect_to root_url
  end
  
  private
  
  def set_params
    params[:user_detail].permit(:first_name, :last_name, :date_of_birth, :occupation, :profession, :marital_status, :number_of_children, :smoking, :drinking, :exercise, :diet, :family_history )
  end
  

end
