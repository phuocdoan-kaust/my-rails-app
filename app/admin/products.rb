ActiveAdmin.register Product do
  permit_params :email, :admin, :name, :payout_rate
  # remove_filter :product_assignments

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :active
      f.input :currency
      f.input :price
      f.input :brand_id
    end
    f.actions
  end

  index do
    id_column
    column :name
    column :active
    column :currency
    column :price
    column :brand_id
    actions
  end
end
