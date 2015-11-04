class ChangeColumnDateToDateTypeInDoctorVisits < ActiveRecord::Migration
  def change
   change_column :doctor_visits, :date_of_visit, 'date USING CAST(date_of_visit AS date)'
   change_column :family_members, :date_of_birth, 'date USING CAST(date_of_birth AS date)'
  end
end
