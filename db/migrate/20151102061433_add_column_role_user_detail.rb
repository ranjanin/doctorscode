class AddColumnRoleUserDetail < ActiveRecord::Migration
  def change
    remove_column :users, :role
    add_column :user_details, :role, :string
  end
end
