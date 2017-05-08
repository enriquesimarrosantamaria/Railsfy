Rails.application.routes.draw do

  devise_for :users

  resources :posts do 
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end  

  resources :relationships
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts
  resources :users, only: [:show, :destroy, :update] do
    resources :items, only: [:create, :show, :destroy]
  end


  #Define the root URL
  root 'pages#index'

  #Definición de las rutas de las pages
  get '/home' => 'pages#home'

  get '/user/:id' => 'pages#profile'

  get '/explore' => 'pages#explore'

  delete '/user/:id' => 'users#destroy'

  patch '/user/:id' => 'users#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
