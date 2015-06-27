class AddFamilyMmeberIdToDoctorVisits < ActiveRecord::Migration
  def change
    add_column :doctor_visits, :family_member_id, :integer
  end
end
