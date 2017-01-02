class User < ApplicationRecord
  has_secure_password
  has_many :tweets

  validates :name, uniqueness: true
end
