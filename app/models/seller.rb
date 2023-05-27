class Seller < ApplicationRecord
  has_many :product
  validates :name,:email, :dni, :gallery_name, :phone, presence: true
	has_secure_password
	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: true

	 
end
