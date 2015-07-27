class ChangeColumnDateOfVisitStringDoctorvisits < ActiveRecord::Migration
  def change
    change_column :doctor_visits, :date_of_visit, :string
  end
end
