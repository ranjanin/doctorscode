class ChangeDateOfBirthToDateFromStringInFamilyMembers < ActiveRecord::Migration
=begin
  def change
    change_column :family_members, :date_of_birth, :date
  end

=end
  
end