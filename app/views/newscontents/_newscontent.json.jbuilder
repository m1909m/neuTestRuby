json.extract! newscontent, :id, :content, :sendtime, :newsletter_id, :created_at, :updated_at
json.url newscontent_url(newscontent, format: :json)