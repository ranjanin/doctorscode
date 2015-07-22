class DoctorVisitsController < ApplicationController
  
  def index
    @doctor_visits = DoctorVisit.where(['user_id = ? AND family_member_id IS NULL', current_user.id]).paginate(:page => params[:page], :per_page => 25).order('created_at DESC')
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
 
  def doctor_visit_member
    @doctor_visits = DoctorVisit.where(:family_member_id => params[:id]).paginate(:page => params[:doctor_page], :per_page => 5).order('created_at DESC')
    @health_records = HealthRecord.where(:family_member_id => params[:id]).paginate(:page => params[:health_page], :per_page => 5).order('created_at DESC')
  end
    
  def member_doctor_visit_new
    @doctor_visit = DoctorVisit.new  
  end
  
  def member_doctor_visit_create
    @doctor_visit = DoctorVisit.new
    @doctor_visit.user_id = current_user.id
    @doctor_visit.family_member_id = params[:doctor_visit][:family_member_id]
    if @doctor_visit.update_attributes(set_params)
      redirect_to doctor_visits_doctor_visit_member_path(:id => @doctor_visit.family_member_id)
    end
  end
  
 
  
    
  
  private
  
  def set_params
    params[:doctor_visit].permit(:date_of_visit, :doctor, :hospital, :reason_for_visit, :details, :user_id, :family_member_id)
  end
  
end
