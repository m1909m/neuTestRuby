ActiveAdmin.register Page do
  permit_params :content, :for

  form do |f|
    f.inputs 'Neue Seite erstellen' do
      f.input :content, label: "Seiteninhalt", :input_html => { :class => "tinymce" }
      f.input :for, label: "Für Seite: "

    end
    f.actions
  end
end