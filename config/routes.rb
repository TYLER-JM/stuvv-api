Rails.application.routes.draw do
  resources :messages
  resources :requests
  resources :images
  resources :listings
  resources :users

  resources :sessions, only: [:new, :create] 
  get '/sessions' => 'sessions#destroy'
  
  post '/search' => 'listings#index'
  get '/profiles/me' => 'sessions#me'
  # get '/userslistings/:id' => 'listings#users_listings'
  get '/userslistings/:id' => 'users#users_listings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
