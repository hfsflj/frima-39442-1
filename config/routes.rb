Rails.application.routes.draw do
  devise_for :users
  resources :users, :show
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :items do
  resources :orders, only: [:index, :create]
  end
  root 'items#index'
  get '/new_item_path', to: 'items#new'
end
