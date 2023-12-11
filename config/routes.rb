Rails.application.routes.draw do
  devise_for :users
  resources :users, :show
  resources :items, only: [:index, :show, :new, :create]
  root 'items#index'
end
