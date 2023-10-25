ActiveAdmin.register Product do
  permit_params :email, :admin, :name, :payout_rate

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :active
      f.input :currency
      f.input :price
      f.input :brand_id
      f.input :user_id
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
    column :user_id
    actions
  end
end
