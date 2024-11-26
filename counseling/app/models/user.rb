class User < ApplicationRecord
  has_many :books
  has_many :appointments
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /@/, message: "must contain @" }, uniqueness: true
  #validates :password, presence: true, if: :has_password?

  def self.new_from_hash(user_hash)
    user = User.new user_hash
    user.password_digest = 0
    #user.save(validate: false)
    user
  end

  def has_password?
    self.password_digest.nil? || self.password_digest != '0'
  end
end