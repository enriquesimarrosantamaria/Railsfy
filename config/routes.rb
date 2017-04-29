Rails.application.routes.draw do

  devise_for :users
  #Define the root URL
  root 'pages#index'

  #Definición de las rutas de las pages
  get '/home' => 'pages#home'

  get '/user/:id' => 'pages#profile'

  get '/explore' => 'pages#explore' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
