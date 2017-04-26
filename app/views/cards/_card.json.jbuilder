json.extract! card, :id, :name, :vorname, :einrichtung, :adresse, :ort, :email, :articles, :created_at, :updated_at, :anzahl, :sum
json.url card_url(card, format: :json)