class AddUserIdToDoctorVisits < ActiveRecord::Migration
  def change
    add_column :doctor_visits, :user_id, :integer
  end
end
