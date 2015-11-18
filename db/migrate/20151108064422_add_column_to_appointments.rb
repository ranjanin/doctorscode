class AddColumnToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_date, :date
    add_column :appointments, :appointment_hour, :string
  end
end
