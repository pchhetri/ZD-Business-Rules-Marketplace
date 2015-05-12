json.array!(@macros) do |macro|
  json.extract! macro, :id, :name, :tags, :description, :json, :package_id
  json.url macro_url(macro, format: :json)
end
