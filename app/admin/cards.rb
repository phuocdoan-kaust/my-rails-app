ActiveAdmin.register Card do
  # remove_filter :product_assignments

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :requested_date, :state, :pin, :activation_code, :card_number, :name, :dob, :sid, :expired_date

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :user_id
      f.input :requested_date
      f.input :state
      f.input :pin
      f.input :activation_code
      f.input :card_number
      f.input :name
      f.input :dob
      f.input :sid
      f.input :expired_date
    end
    f.actions
  end

  index do
    id_column
    column :user_id
    column :requested_date
    column :state
    column :pin
    column :activation_code
    column :card_number
    column :name
    column :dob
    column :sid
    column :expired_date
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
