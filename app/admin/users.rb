ActiveAdmin.register User do
  # remove_filter :product_assignments

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :admin, :name, :payout_rate

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email
      f.input :name
      f.input :payout_rate
      f.input :admin
    end
    f.actions
  end

  index do
    id_column
    column :name
    column :email
    column :payout_rate
    column :admin
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
