class Product < ApplicationRecord
  CURRENCIES = %w(PEN USD CLP COP ARS BRL )

  belongs_to :seller
  has_many_attached :images
  
  validates :title, :price, :currency, presence: true
  validates :description, presence: true, length: { maximum: 160 }
  
end
