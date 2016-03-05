json.array!(@spaces) do |space|
  json.extract! space, :id, :user_id, :spacename
  json.url space_url(space, format: :json)
end
