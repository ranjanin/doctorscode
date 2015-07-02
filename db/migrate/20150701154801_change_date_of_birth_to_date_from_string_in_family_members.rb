class ChangeDateOfBirthToDateFromStringInFamilyMembers < ActiveRecord::Migration
  def change
    change_column :family_members, :date_of_birth, :date
  end
end
