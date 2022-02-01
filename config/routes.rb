Rails.application.routes.draw do
  devise_for :users

  resources :food, only: [:index, :new, :create]

  # resources :posts, only: [:index, :show, :new, :create] do
  #   resources :comments, only: [:new, :create]
  #   resources :likes, only: [:create]
  # end

  # Defines the root path route ("/")
  root "food#index"
end
