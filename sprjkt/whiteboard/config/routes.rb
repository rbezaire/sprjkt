Rails.application.routes.draw do

  resources :layers
  resources :spaces
  devise_for :users

  patch '/spaces/:space_id' => 'spaces#update'
  patch '/spaces/:space_id/clear' => 'spaces#clear'

  root 'spaces#index'

end
