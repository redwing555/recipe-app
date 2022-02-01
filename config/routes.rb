Rails.application.routes.draw do

  devise_for :users
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index]

 
  root "food#index"

  
end
