class Patient < ActiveRecord::Base
  belongs_to :user
  
  has_many :appointments
  has_many :doctors, through: :appointments
end
