class Product < ApplicationRecord
  belongs_to :seller

  validates :title, :price, presence: true
  validates :description, presence: true, length: { maximum: 25 }
end
