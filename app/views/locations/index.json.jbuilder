json.array!(@locations) do |location|
  json.extract! location, :id, :title, :lat, :lng, :location_type, :user_id
  json.url location_url(location, format: :json)
end
