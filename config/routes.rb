Rails.application.routes.draw do

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

  get '/conpruebas/:id', to: 'home#conpruebasid'
  post '/pruebasresp', to: 'home#pruebasresp'

  get 'prueba/show'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
