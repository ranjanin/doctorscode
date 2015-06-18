class ChangeColumnNamesInHealthRecords < ActiveRecord::Migration
  def change
    rename_column :health_records, :record_type, :health_record_type
    rename_column :health_records, :record_date, :health_record_date
    rename_column :health_records, :record, :health_record
    
  end
end
