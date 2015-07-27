class ChangeColumnDateToDateTypeInDoctorVisits < ActiveRecord::Migration
  def change
    change_column :doctor_visits, :date_of_visit, :date
    change_column :family_members, :date_of_birth, :date
  end
end
