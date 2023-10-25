class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["active", "brand_id", "created_at", "currency", "id", "name", "price", "updated_at", "user_id"]
  end

  belongs_to :brand
  belongs_to :user
  validates :name, :price, :currency, presence: true
end
