Rails.application.routes.draw do
  # get "amazon_clone/index"
  resources :users, only: [:new, :create]

  resources :products
  # post 'user/create'
  # get "users/new"
  get '/signup', to: 'users#new'
  get "up" => "rails/health#show", as: :rails_health_check

  root "amazon_clone#index"
end
