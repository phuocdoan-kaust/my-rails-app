class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :active
      t.string :currency
      t.integer :price
      t.belongs_to :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
