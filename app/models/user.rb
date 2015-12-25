class User < ActiveRecord::Base
  has_secure_password
  has_many :ticket_types
  has_many :event

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
end
