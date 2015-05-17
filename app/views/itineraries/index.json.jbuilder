json.array!(@itineraries) do |itinerary|
  json.extract! itinerary, :id, :start_date, :end_date, :user_id
  json.url itinerary_url(itinerary, format: :json)
end
