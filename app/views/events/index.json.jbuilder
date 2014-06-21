json.array!(@events) do |event|
  json.extract! event, :id, :event_name, :start_date, :start_time, :duration, :description, :url, :image_url
  json.url event_url(event, format: :json)
end
