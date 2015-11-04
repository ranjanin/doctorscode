class UserDetailsController < ApplicationController
  
  def index
  end
  
  def new
    @user = current_user
    @user_detail = UserDetail.new
   # @user.patients.build
    #@user.doctors.build
    
  end
  
  def create
    @user = current_user
    @user_detail = UserDetail.new(set_params)
    
   @user_detail.user_id = current_user.id
    if @user_detail.save
      
       if params[:user_detail][:role] == "Member"
          @user.patients.first.user_id = @user.id
          @user.doctors.first.delete
       elsif params[:user_detail][:role] == "Doctor"
          @user.doctors.build
          @user.doctors.first.user_id = @user.id
          @user.patients.first.delete
       end
   
       if current_user.user_detail.role == "Member"
        redirect_to user_detail_path(@user_detail.id)
       elsif current_user.user_detail.role == "Doctor" 
          if current_user.doctors.first.first_name.present?
            redirect_to doctor_path(current_user.doctors.first.id)
          elsif current_user.doctors.first.first_name.nil?
            redirect_to new_doctor_path
          end
       end
    else
      render action: "new"
    end
  end

  def show
    @user_detail = UserDetail.find(params[:id])
  end
  
  def edit
    @user_detail = current_user.user_detail
  end
  
  def update
    @user_detail = UserDetail.find(params[:id])
    if @user_detail.update_attributes(set_params)
      redirect_to user_detail_path(@user_detail.id)
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
    params[:user_detail].permit(:first_name, :last_name, :date_of_birth, :occupation, :profession, :marital_status, :number_of_children, :smoking, :drinking, :exercise, :diet, :gender, :height, :weight, :blood_group, :family_history, :role )
  end
  

end
