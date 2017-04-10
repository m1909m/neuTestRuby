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
      f.input :title, "Artikel Titel"
      f.input :price, "Preis pro Artikel"
      f.input :count, "Anzahl an Artikel"
      f.input :site, "Für Seite: "
    end
    f.actions
  end

end