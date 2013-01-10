class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  has_many :items

  validates :email, :presence => true
  validates :password, :presence => true, :on => :create

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
