class AddNameToCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :name, :string
    add_column :cards, :dob, :date
    add_column :cards, :sid, :string
    add_column :cards, :expired_date, :date
  end
end
