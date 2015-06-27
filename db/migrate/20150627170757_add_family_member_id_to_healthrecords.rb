class AddFamilyMemberIdToHealthrecords < ActiveRecord::Migration
  def change
    add_column :health_records, :family_member_id, :integer
  end
end
