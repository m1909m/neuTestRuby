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
      f.input :name, :label => 'Titel'
      f.input :description, :label => 'Beschreibung'
      f.input :minSize, :label => 'Gewünschte Teilnehmer'
      f.input :maxSize, :label => 'Maximale Teilnehmer'
  #    f.input :days
      f.input :hours, :label => 'Dauer der Veranstaltung in Minuten'
      f.input :weeks, :label => 'Dauer der Veranstaltung in Wochen'
      f.input :startDate, as: :datepicker, :label => 'Start der Veranstaltung'
      f.input :endDate, as: :datepicker, :label => 'Ende der Veranstaltung'
      f.input :startLoginDate, as: :datepicker, :label => 'Beginn der Anmeldung'
      f.input :endLoginDate, as: :datepicker, :label => 'Ende der Anmeldung'

    end
    f.actions
  end


end