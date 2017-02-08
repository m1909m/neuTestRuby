ActiveAdmin.register Room do

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
permit_params :number, :size, :building
#TODO Building picture

form do |f|
  f.inputs 'Raum Hinzufügen' do
    f.input :number
    f.input :size
    f.input :building
  end
  f.actions
end

end
