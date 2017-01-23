ActiveAdmin.register Event do

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

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description
      f.input :minSize
      f.input :maxSize
      f.input :weeks
      f.input :days
      f.input :hours
      f.input :startDate, as: :datepicker
      f.input :endDate, as: :datepicker
      f.input :startLoginDate, as: :datepicker
      f.input :endLoginDate, as: :datepicker

    end
    f.actions
  end


end
