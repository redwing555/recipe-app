Rails.application.routes.draw do
  devise_for :users

  resources :food, only: [:index, :new, :create, :destroy]

  # Defines the root path route ("/")
  root "food#index"
end
