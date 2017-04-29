Rails.application.routes.draw do

  #Define the root URL
  root 'pages#index'

  #Definición de las rutas de las pages
  get '/home' => 'pages#home'

  get '/profile' => 'pages#profile'

  get '/explore' => 'pages#explore' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end