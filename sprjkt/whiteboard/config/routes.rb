Rails.application.routes.draw do

  resources :layers
  resources :spaces
  devise_for :users

  patch '/spaces/:space_id' => 'spaces#update'
  patch '/spaces/:space_id/clear' => 'spaces#clear'
  get '/spaces/:space_id/load' => 'spaces#load'

  root 'spaces#index'

end
