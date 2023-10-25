class AddFullTextIndexToProducts < ActiveRecord::Migration[7.0]
  def change
    add_index :products, [:title, :description], name:'title_description', type: :fulltext
  end
end
