json.extract! card, :id, :name, :vorname, :einrichtung, :adresse, :ort, :email, :articles, :created_at, :updated_at
json.url card_url(card, format: :json)