class Product < ApplicationRecord
  belongs_to :brand
  validates :name, :price, :currency, presence: true
end
