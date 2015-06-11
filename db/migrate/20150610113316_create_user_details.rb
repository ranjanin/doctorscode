class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :occupation
      t.string :profession
      t.string :marital_status
      t.integer :number_of_children
      t.string :smoking
      t.string :drinking
      t.string :exercise
      t.string :diet
      t.string :family_history
      t.integer :user_id

      t.timestamps
    end
  end
end
