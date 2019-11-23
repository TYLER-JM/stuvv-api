Rails.application.routes.draw do
  resources :messages
  resources :requests
  resources :images
  resources :listings
  resources :users

  resources :sessions, only: [:new, :create] 
  get '/sessions' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
