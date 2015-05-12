json.array!(@automations) do |automation|
  json.extract! automation, :id, :name, :tags, :description, :json, :package_id
  json.url automation_url(automation, format: :json)
end
