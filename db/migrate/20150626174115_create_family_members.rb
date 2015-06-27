class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.string :relation
      t.string :name
      t.string :age
      t.integer :user_id
      t.timestamps
    end
  end
end
