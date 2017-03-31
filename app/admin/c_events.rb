ActiveAdmin.register CEvent, as: "Veranstaltungen" do

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
  actions :all, :except => [:new]
  permit_params :title, :start, :end, :description, :created_at, :updated_at, :minSize, :maxSize, :member, :free

  index do
    column "Veranstaltug", :title
    column "Beschreibung", :description
    column "Startdatum", :start
    column "Enddatum", :end
    column "Min. Teilnehmer", :minSize
    column "Max. Teilnehmer", :maxSize
    column "Angemeldete Teilnehmer", :member
    column "Erstellt am", :created_at
    column "Geändert am:", :updated_at
    actions
  end

end
