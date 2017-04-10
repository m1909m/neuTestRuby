ActiveAdmin.register Article do
  permit_params :title, :price, :count, :site

  index do
    column "Artikel Titel", :title
    column "Preis", :price
    column "Verfügbar", :count
    column "Für Seite:", :site
    actions
  end

  form do |f|
    f.inputs 'Neuen Artikel anlegen' do
      f.input :title, label: "Artikel Titel"
      f.input :price, label: "Preis pro Artikel", :as => :number
      f.input :count, label: "Anzahl an Artikel", :as => :number
      f.input :site, label: "Für Seite: "
    end
    f.actions
  end

end