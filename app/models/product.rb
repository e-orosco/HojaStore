class Product < ApplicationRecord
  CURRENCIES = %w(PEN USD CLP COP ARS BRL )
  include PgSearch::Model

  belongs_to :seller
  has_many_attached :images
  
  validates :title, :price, :currency, presence: true
  validates :description, presence: true, length: { maximum: 160 }
  
  pg_search_scope :search_by_full_name, against: [:title, :description], using: { tsearch: { prefix: true } }
    
end
