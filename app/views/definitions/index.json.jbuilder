json.array!(@definitions) do |definition|
  json.extract! definition, :id, :unit_id, :formula, :converted_to_id
  json.url definition_url(definition, format: :json)
end
