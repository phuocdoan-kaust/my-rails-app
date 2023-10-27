class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "admin", "name", "payout_rate"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["products", "product_assignments"]
  end

  has_many :product_assignments, dependent: :destroy
  has_many :products, through: :product_assignments
  has_many :reports
  validates :name, presence: true, uniqueness: true
end
