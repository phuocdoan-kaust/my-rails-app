class ProductAssignment < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "product_id", "updated_at", "user_id"]
  end

  belongs_to :product
  belongs_to :user
end
