Rails.application.routes.draw do
  devise_for :users

  
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy]

  get '/public_recipes', to: 'recipes#public_recipes'

 
  root "food#index"

end
