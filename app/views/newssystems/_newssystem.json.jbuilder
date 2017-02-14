json.extract! newssystem, :id, :title, :subTitle, :story, :created_at, :updated_at, :send, :sendDate
json.url newssystem_url(newssystem, format: :json)