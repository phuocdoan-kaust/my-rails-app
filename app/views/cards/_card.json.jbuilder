json.extract! card, :id, :user_id, :requested_date, :state, :pin, :activation_code, :created_at, :updated_at
json.url card_url(card, format: :json)
