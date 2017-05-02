json.array! @c_events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S%Z'
  json.id event.id
  json.title event.title
  json.start event.start.strftime(date_format)
  json.end event.end.strftime(date_format)
  json.startSecond event.startSecond.strftime(date_format)
  json.endSecond event.endSecond.strftime(date_format)
  json.startThird event.startThird.strftime(date_format)
  json.endThird event.endThird.strftime(date_format)
  json.startLogin event.startLogin.strftime(date_format)
  json.endLogin event.endLogin.strftime(date_format)
  json.color event.color unless event.color.blank?
  json.allDay event.all_day_event? ? true : false
  json.room_id event.room_id
  json.minSize event.minSize
  json.member event.member
  json.maxSize event.maxSize
  json.free event.is_free? ? 1 : 0
  #json.update_url event_path(event, method: :patch)
  #json.edit_url edit_event_path(event)
end