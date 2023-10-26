class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :requested_date
      t.string :state
      t.string :pin
      t.string :activation_code

      t.timestamps
    end
  end
end
