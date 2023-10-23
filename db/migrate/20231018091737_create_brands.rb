class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :country
      t.bigint :code
      t.boolean :active

      t.timestamps
    end
  end
end
