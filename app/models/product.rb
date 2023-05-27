class Product < ApplicationRecord
  belongs_to :seller
  has_many_attached :images
  
  validates :title, :price, presence: true
  validates :description, presence: true, length: { maximum: 25 }
  
end
