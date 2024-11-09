class User < ApplicationRecord
  has_many :books
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /@/, message: "must contain @" }, uniqueness: true
end
