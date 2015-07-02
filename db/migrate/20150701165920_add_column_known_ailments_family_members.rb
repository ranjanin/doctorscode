class AddColumnKnownAilmentsFamilyMembers < ActiveRecord::Migration
  def change
    add_column :family_members, :known_ailments, :string
  end
end
