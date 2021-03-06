class HealthRecordsController < ApplicationController
  
  def index
    @health_records = HealthRecord.where(['user_id = ? AND family_member_id IS NULL', current_user.id]).paginate(:page => params[:page], :per_page => 25).order('created_at DESC')
  end
  
  def new
    @health_record = HealthRecord.new
  end
  
  def create
    @health_record = HealthRecord.new(set_params)
    @health_record.user_id = current_user.id
    if @health_record.save
      redirect_to health_records_path
    else
      render action: 'new'
    end
  end
  
  def show
    @health_record = HealthRecord.find(params[:id])
  end
  
  def edit
    @health_record = HealthRecord.find(params[:id])
  end
  
  def update
    @health_record = HealthRecord.find(params[:id])
    if @health_record.update_attributes(set_params)
      redirect_to health_records_path
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @health_record = HealthRecord.find(params[:id])
    @health_record.destroy
  end
  
  def member_health_record_new
    @health_record = HealthRecord.new
  end
  
  def member_health_record_create
    @health_record = HealthRecord.new
    @health_record.user_id = current_user.id
    @health_record.family_member_id = params[:health_record][:family_member_id]
    if @health_record.update_attributes(set_params)
      redirect_to doctor_visits_doctor_visit_member_path(:id => @health_record.family_member_id)
    end
  end
  
  
  private
  
  def set_params
    params[:health_record].permit(:health_record, :health_record_type, :health_record_date, :user_id, :family_member_id)
  end
  
end
