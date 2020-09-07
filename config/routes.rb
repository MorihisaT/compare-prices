Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'items#index'
  resources :users, only: :show
  resources :item, only: [:new, :create]
end
