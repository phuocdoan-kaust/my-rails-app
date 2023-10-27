class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :report_type
      t.string :note
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
