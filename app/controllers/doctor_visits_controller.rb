class DoctorVisitsController < ApplicationController
  
  def index
    @doctor_visits = DoctorVisit.where(:user_id => current_user.id)
  end
  
  def new
    @doctor_visit = DoctorVisit.new
  end
  
  def create
    @doctor_visit = DoctorVisit.new(set_params)
    @doctor_visit.user_id = current_user.id
    if @doctor_visit.save
      redirect_to doctor_visits_path
    else
      render action: 'new'
    end    
  end
  
  def show
    @doctor_visit = DoctorVisit.find(params[:id])
  end
  
  def edit
    @doctor_visit = DoctorVisit.find(params[:id])
  end
  
  def update
    @doctor_visit = DoctorVisit.find(params[:id])
    if @doctor_visit.update_attributes(set_params)
      redirect_to doctor_visit_path(current_user.doctor_visit)
    else
      render action: 'edit'
    end
  end
  
  def destroy
  end
 
  def doctor_visit
  end
  
  def doctor_visit_update
  end
  
    
  
  private
  
  def set_params
    params[:doctor_visit].permit(:date_of_visit, :doctor, :hospital, :reason_for_visit, :details, :user_id)
  end
  
end