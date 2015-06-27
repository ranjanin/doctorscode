class FamilyMember < ActiveRecord::Base
  
  belongs_to :user
  has_many :doctor_visits
  has_many :health_records
end
