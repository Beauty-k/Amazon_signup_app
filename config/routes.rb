Rails.application.routes.draw do
  get "users/new"
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "users#index"
end
