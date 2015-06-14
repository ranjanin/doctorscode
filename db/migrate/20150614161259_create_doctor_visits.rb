class CreateDoctorVisits < ActiveRecord::Migration
  def change
    create_table :doctor_visits do |t|
      t.date   :date_of_visit
      t.string :doctor
      t.string :hospital
      t.string :reason_for_visit
      t.string :details

      t.timestamps
    end
  end
end
