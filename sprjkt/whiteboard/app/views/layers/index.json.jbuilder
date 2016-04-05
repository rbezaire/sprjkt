json.array!(@layers) do |layer|
  json.extract! layer, :id, :aryx, :aryy, :arydrag, :zval
  json.url layer_url(layer, format: :json)
end
