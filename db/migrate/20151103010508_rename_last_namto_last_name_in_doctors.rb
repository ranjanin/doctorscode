class RenameLastNamtoLastNameInDoctors < ActiveRecord::Migration
  def change
    rename_column :doctors, :last_nam, :last_name
  end
end
