Rails.application.routes.draw do
  devise_for :users
  resources :users, :show

  
  root 'items#index'
end
