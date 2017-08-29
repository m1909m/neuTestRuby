ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :email, :firstname, :lastname, :street, :plz, :city, role_ids: []

  index do
    column :email
    column :firstname
    column :lastname
    column :street
    column :plz
    column :citys
    actions
  end


  form do |f|
    f.inputs 'Details' do
      f.input :email
      f.input :firstName
      f.input :lastName
      f.input :street
      f.input :plz

      f.input :city
#      f.input :password
#      f.input :password_confirmation
      f.input :roles
    end
    f.actions
  end


end
