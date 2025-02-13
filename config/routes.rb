Rails.application.routes.draw do
  get "products/index"
  get "sessions/new"
  # get "amazon_clone/index"
  resources :users, path: 'register_new_user'
  resources :products, only: [:index, :show]
  # resource :cart, only: [:show] 
  resources :cart_items, only: [:index, :create, :destroy]
  resources :shipping_addresses
  resources :checkout, only: [:show, :create]
  resources :orders, only: [:show]
  get 'cart', to: 'carts#show', as: 'cart'
  get "/checkout", to: "checkout#show"
  # get "checkout/index"
  delete '/cart_items',to: 'cart_items#destroy'
  # get '/checkout', to; 'checkouts#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
  get "/render_profile", to: "users#render_profile"
  get "/office_product", to: "amazon_clone#render_products"
  root "amazon_clone#index"
end
