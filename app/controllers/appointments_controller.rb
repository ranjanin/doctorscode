class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  
  
  def index
    @appointments = Appointment.where(:user_id => current_user.id).order('created_at DESC')
  end
  
  def new
    @appointment  = Appointment.new
  end
  
  def create
    @appointment  = Appointment.new(set_params)
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to appointments_path
    else
      render action: "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def set_params
    params[:appointment].permit(:appointment_date, :appointment_hour, :user_id, :patient_id, :doctor_id )
  end
end
