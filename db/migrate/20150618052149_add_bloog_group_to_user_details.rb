class AddBloogGroupToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :blood_group, :string
  end
end
