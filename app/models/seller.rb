class Seller < ApplicationRecord
  has_many :product

  validates :name,:email, :dni, :gallery_name, :phone, presence: true
end
