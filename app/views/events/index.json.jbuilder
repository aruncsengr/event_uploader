json.array!(@events) do |event|
  date_format = event.all_day? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  json.title event.title
  json.start event.start_time.strftime(date_format)
  json.end event.end_time.strftime(date_format)
end
