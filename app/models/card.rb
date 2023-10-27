class Card < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["activation_code", "card_number", "created_at", "dob", "expired_date", "id", "name", "pin", "requested_date", "sid", "state", "updated_at", "user_id"]
  end

  belongs_to :user
  validates :name, :sid, :dob, presence: true

  @@card_number_prefix = "TEST-CARD-"

  def self.generate_card_number
    last_card = Card.last
    return @@card_number_prefix + last_card.id.to_s
  end

  def self.get_expired_date
    return Time.now + 5.year
  end
end
