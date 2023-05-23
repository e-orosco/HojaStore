class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :email
      t.string :dni
      t.string :gallery_name
      t.string :phone

      t.timestamps
    end
  end
end
