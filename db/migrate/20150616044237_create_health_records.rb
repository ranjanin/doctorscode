class CreateHealthRecords < ActiveRecord::Migration
  def change
    create_table :health_records do |t|
      t.string :record_type
      t.date :record_date
      t.string :record
      t.timestamps
    end
  end
end
