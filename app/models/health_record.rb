class HealthRecord < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :family_member
  
  mount_uploader :health_record, ImageUploader
 
end
