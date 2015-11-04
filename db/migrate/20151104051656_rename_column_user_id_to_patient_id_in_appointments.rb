class RenameColumnUserIdToPatientIdInAppointments < ActiveRecord::Migration
  def change
    rename_column :appointments, :user_id, :patient_id
  end
end
