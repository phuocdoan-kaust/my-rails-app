json.extract! product, :id, :name, :brand, :price, :active, :currency, :created_at, :updated_at
json.url product_url(product, format: :json)
