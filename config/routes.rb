Rails.application.routes.draw do
  devise_for :users
  resources :users
  get '/users/:id', to: 'users#show', as: :user_show

  root 'items#index'
end
