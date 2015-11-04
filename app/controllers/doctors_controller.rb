class DoctorsController < ApplicationController
  
  def index
  end
  
  def new
    @doctor = Doctor.new
  end
  
  def create
    @doctor = Doctor.new(set_params)
    @doctor.user_id = current_user.id
    if @doctor.save
      redirect_to doctor_path(@doctor.id)
    else
      render action: "new"
    end
  end
    
    def show
     @doctor = Doctor.find(params[:id])
    end
    
    def edit
      @doctor = Doctor.find(params[:id])
    end
    
    def update
      @doctor = Doctor.find(params[:id])
      @doctor.user_id = current_user.id
      if @doctor.update_attributes(set_params)
        redirect_to doctor_path(@doctor.id)
      else
        render action: "edit"
      end
    end
      
      def destroy
        @doctor = Doctor.find(params[:id])
        @doctor.destroy
        redirect_to doctors_path
      end
      
      private
      
      def set_params
        params[:doctor].permit(:first_name, :last_name, :display_name, :qualification, :specilization, :address, :description, :user_id)
      end
end
  
  
