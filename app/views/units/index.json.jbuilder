json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :alias
  json.url unit_url(unit, format: :json)
end
