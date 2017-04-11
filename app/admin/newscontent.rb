ActiveAdmin.register Newscontent do

  permit_params :content, :sendtime, newsletter_ids: []

  form do |f|
    f.inputs 'Newsletter layout erstellen' do
      f.input :content
      f.input :sendtime, as: :datepicker
      f.input :newsletters
    end
    f.actions
  end

end