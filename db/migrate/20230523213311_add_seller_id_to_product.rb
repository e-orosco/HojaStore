class AddSellerIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :seller, null: false, foreign_key: true
  end
end
