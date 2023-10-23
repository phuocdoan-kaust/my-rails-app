class AddPayoutRatesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :payout_rate, :integer
  end
end
