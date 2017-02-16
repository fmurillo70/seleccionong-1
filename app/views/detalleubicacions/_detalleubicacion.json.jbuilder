json.extract! detalleubicacion, :id, :nombre, :ubicacionvivienda_id, :created_at, :updated_at
json.url detalleubicacion_url(detalleubicacion, format: :json)