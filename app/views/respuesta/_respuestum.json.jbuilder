json.extract! respuestum, :id, :texto, :puntaje, :created_at, :updated_at
json.url respuestum_url(respuestum, format: :json)