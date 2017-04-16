json.extract! news_content, :id, :title, :content, :sendtime, :newsletter_id, :created_at, :updated_at
json.url news_content_url(news_content, format: :json)