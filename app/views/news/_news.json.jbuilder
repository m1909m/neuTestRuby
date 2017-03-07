json.extract! news, :id, :title, :subTitle, :story, :sendDate, :created_at, :updated_at
json.url news_url(news, format: :json)
