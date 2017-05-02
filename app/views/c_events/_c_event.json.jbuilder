date_format = c_event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S%Z'
json.extract! c_event, :id, :title, :start.strftime(date_format), :end.strftime(date_format), :startSecond.strftime(date_format), :endSecond.strftime(date_format), :startThird.strftime(date_format), :endThird.strftime(date_format), :startLogin.strftime(date_format), :endLogin.strftime(date_format), :color, :all_day_event, :description, :minSize, :maxSize, :member, :room_id, :free, :created_at, :updated_at
json.url c_event_url(c_event, format: :json)


