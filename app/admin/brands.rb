ActiveAdmin.register Brand do
  permit_params :name, :code, :active

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :code
      f.input :active
    end
    f.actions
  end

  index do
    id_column
    column :name
    column :code
    column :active
    actions
  end
end
