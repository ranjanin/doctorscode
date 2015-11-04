class AddColumnsToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_nam, :string
    add_column :doctors, :display_name, :string
    add_column :doctors, :qualification, :string
    add_column :doctors, :specilization, :string
    add_column :doctors, :address, :string    
    add_column :doctors, :description, :string    
  end
end
