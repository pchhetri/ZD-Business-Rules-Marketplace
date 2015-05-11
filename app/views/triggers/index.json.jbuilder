json.array!(@triggers) do |trigger|
  json.extract! trigger, :id, :name, :description, :json
end
