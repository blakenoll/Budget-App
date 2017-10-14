class User < ApplicationRecord
  has_secure_password
  has_many :envelopes
  has_many :transactions

  validates :username, uniqueness: true
end
