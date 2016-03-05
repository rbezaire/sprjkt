Rails.application.routes.draw do

  resources :layers
  resources :spaces
  devise_for :users

  root 'spaces#index'

end
