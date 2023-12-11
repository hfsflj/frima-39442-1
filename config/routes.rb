Rails.application.routes.draw do
  devise_for :users
  resources :users, :show
  resources :items, only: [:index, :show, :new, :create]
  get '/new_item_path', to: 'items#new'
  post '/items', to: 'items#create'
  root 'items#index'
end
