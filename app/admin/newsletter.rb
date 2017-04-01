ActiveAdmin.register Newsletter do

  permit_params :newsHeader, :newsBody, :newsFooter

  form do |f|
    f.inputs 'Newsletter layout erstellen' do
      f.input :newsHeader, :class => "tinymce"
      f.input :newsBody
      f.input :newsFooter
    end
    f.actions
  end

end