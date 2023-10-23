json.extract! product, :id, :name, :active, :currency, :price, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
