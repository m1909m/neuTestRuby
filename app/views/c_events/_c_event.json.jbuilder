date_format = c_event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S%Z'
json.extract! c_event, :id, :title, :start.strftime(date_format), :end.strftime(date_format), :color, :all_day_event, :description, :created_at, :updated_at
json.url c_event_url(c_event, format: :json)


