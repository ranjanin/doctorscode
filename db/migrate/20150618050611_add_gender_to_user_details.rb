class AddGenderToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :gender, :string
    add_column :user_details, :height, :string
    add_column :user_details, :weight, :string
  end
end
