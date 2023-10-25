class Product < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["active", "brand_id", "created_at", "currency", "id", "name", "price", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["brand", "product_assignments", "users"]
  end

  belongs_to :brand
  has_many :product_assignments, dependent: :destroy
  has_many :users, through: :product_assignments

  validates :name, :price, :currency, presence: true
end
