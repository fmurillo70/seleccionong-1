Rails.application.routes.draw do

  resources :zones
  resources :sectors
  resources :afiches
  get 'verificacionusers/index'

  resources :voluntario_pruebas
  resources :respuesta
  resources :resultados
  resources :opciones_respuesta
  resources :pregunta
  resources :pruebas_competencia
  resources :aptitudes
  resources :nivelacademicos
  resources :jornadaestudios
  resources :tipoestudios
  resources :ultimotitulos
  resources :tipocontactos
  resources :tenenciaviviendas
  resources :detalleubicacions
  resources :ubicacionviviendas
  resources :religions
  resources :tipo_estado_civils
  resources :tipo_de_sexos
  resources :tipo_documentos
  resources :paises
  root 'home#index'


  resources :publicaciones


  get 'prueba/index'
  get 'home/conpruebas'
  get 'home/convocatorias'

  get '/conpruebas/:id', to: 'home#conpruebasid'

  get '/ong/new', to: 'verificacionusers#ong'
  post '/home/aprobacion', to: 'home#aprobacion'
  post '/home/aplicarconvocatoria', to: 'home#aplicarconvocatoria'
  post '/ong/create', to: 'verificacionusers#ongcreate'
  post '/voluntario/create', to: 'verificacionusers#voluntariocreate'
  get '/v1/departamentos', to: 'verificacionusers#departamentos'
  get '/v1/municipios/:id', to: 'verificacionusers#municipios'
  post '/pruebasresp', to: 'home#pruebasresp'
  put '/subirdocumentos', to: 'home#edit'


  post '/checkemail', to: 'verificacionusers#emailcheck'

  get 'prueba/show'



  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
