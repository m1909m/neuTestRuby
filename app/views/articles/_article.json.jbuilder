json.extract! article, :id, :title, :price, :count, :site, :created_at, :updated_at
json.url card_url(article, format: :json)