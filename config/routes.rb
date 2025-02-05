Rails.application.routes.draw do
  get "sessions/new"
  # get "amazon_clone/index"
  resources :users
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]  # Singular resource for a single cart per user
  resources :cart_items, only: [:create, :destroy] 
  # resources :products
  # post 'user/create'
  # get "users/new"
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
  get "/render_profile", to: "users#render_profile"

  root "amazon_clone#index"
end
