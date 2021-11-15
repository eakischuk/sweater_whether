class User < ApplicationRecord
  has_secure_password
  
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true
  validates :api_key, uniqueness: true
end
