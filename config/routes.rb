Rails.application.routes.draw do
  get "products/index"
  get "sessions/new"
  # get "amazon_clone/index"
  resources :users
  resources :products, only: [:index, :show]
  resource :cart, only: [:show] 
  resources :cart_items, only: [:index, :create, :destroy]
  # delete '/cart_items',to: 'cart_items#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
  get "/render_profile", to: "users#render_profile"

  root "amazon_clone#index"
end
