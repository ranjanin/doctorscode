class AddColumnsToFamilyMembers < ActiveRecord::Migration
  def change
    rename_column :family_members, :name, :first_name
    add_column :family_members, :last_name, :string
    rename_column :family_members, :age, :date_of_birth
    add_column :family_members, :blood_group, :string
    add_column :family_members, :height, :string
    add_column :family_members, :weight, :string
  end
end
