json.array!(@triggers) do |trigger|
  json.extract! trigger, :id, :name, :tags, :description, :json, :package_id
  json.url trigger_url(trigger, format: :json)
end
