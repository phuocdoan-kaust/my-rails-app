class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :brand, foreign_key: true
      t.bigint :price
      t.boolean :active
      t.string :currency

      t.timestamps
    end
  end
end
