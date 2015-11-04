class UserDetail < ActiveRecord::Base
  
  after_create :create_doctor
  
  belongs_to :user
  validates_presence_of :role
  
  
  
  
  
  def create_doctor
    User.current.doctors <<  Doctor.new
    User.current.patients << Patient.new
  end
end
