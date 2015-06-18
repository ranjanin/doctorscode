class HealthRecord < ActiveRecord::Base
  
  belongs_to :user
  
  mount_uploader :health_record, ImageUploader
 
end
