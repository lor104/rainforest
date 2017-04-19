Rails.application.routes.draw do
  resources :products
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
