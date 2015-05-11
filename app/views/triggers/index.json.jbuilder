json.array!(@triggers) do |trigger|
  json.extract! trigger, :id, :name, :json
end
