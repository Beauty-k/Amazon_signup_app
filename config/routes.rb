Rails.application.routes.draw do
  # devise_for :users
  # devise_for :customers
  # resources :customers
  # devise_for :users
  get "products/index"
  get "sessions/new"
  # get "amazon_clone/index"
  resources :users, path: 'register_new_user'
  # new_user_session GET  /users/sign_in
  # destroy_user_session DELETE /users/sign_out
  resources :products, only: [:index, :show]
  # resource :cart, only: [:show] 
  resources :cart_items, only: [:index, :show, :create, :destroy]
  resources :shipping_addresses
  resources :checkout, only: [:show, :create]
  resources :orders, only: [:show]
  get 'cart', to: 'carts#show', as: 'cart'
  get "/checkout", to: "checkout#show"
  # get "checkout/index"
  delete '/cart_item',to: 'cart_items#destroy'
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
