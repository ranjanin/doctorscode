class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
 
  has_one :user_detail
  has_many :doctor_visits
  has_many :health_records
  has_many :family_members
  has_many :appointments
 # has_many :doctors, through: :appointments
  has_many :doctors
  has_many :patients
  mount_uploader :image, ImageUploader

  
  
  
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
  
  
end
