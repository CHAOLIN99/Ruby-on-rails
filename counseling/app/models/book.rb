class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  
end
