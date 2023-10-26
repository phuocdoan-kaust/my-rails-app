class AddCardNumberToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :card_number, :string
  end
end
