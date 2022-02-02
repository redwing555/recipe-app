Rails.application.routes.draw do
  devise_for :users

  
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_food, only: [:new]
  end

  resources :recipe_food, only: [:create]

 
  root "food#index"

  
end
