Rails.application.routes.draw do

  root 'home#index'


  resources :publicaciones

  
  get 'prueba/index'

  get 'prueba/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
