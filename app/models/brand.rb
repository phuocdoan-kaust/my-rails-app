class Brand < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["active", "code", "created_at", "id", "name", "updated_at"]
  end

  validates :name, presence: true
end
