json.extract! product, :id, :photo, :title, :description,:currency, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
