class User < ApplicationRecord
  # has_secure_password
  validates_presence_of :email, :password, :username
  validates_uniqueness_of :email
end
