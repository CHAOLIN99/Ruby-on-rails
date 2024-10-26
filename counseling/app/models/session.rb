class Session < ApplicationRecord
  belongs_to :counselor
  validates :title, presence: true
  validates :session_date, presence: true
  validates :session_note, presence: true
  
end
