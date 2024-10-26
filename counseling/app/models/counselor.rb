class Counselor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :specialization, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
