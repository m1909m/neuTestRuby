json.extract! c_event, :id, :title, :start, :end, :color, :description, :created_at, :updated_at
json.url c_event_url(c_event, format: :json)