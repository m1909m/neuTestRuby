ActiveAdmin.register Card do
  permit_params :id, :person_id, :sum, article_ids: []
end