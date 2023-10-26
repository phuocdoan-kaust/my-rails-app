class AddDefaultStateToCard < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cards, :state, "draft"
  end
end
