class ChangeActiveToBrand < ActiveRecord::Migration[7.0]
  def change
    change_column_default :brands, :active, from: false, to: true
    change_column_default :products, :active, from: false, to: true
  end
end
