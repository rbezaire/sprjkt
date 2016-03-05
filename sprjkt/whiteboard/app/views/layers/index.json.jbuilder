json.array!(@layers) do |layer|
  json.extract! layer, :id, :user_id, :drawdata, :z_val
  json.url layer_url(layer, format: :json)
end
