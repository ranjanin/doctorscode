class Doctor < ActiveRecord::Base
  belongs_to :user
  
   has_many :appointments
   has_many :patients, through: :appointments
  
end
