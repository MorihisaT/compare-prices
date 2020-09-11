Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'items#index'

  resources :users, only: [:show, :edit, :update] do
    member do
      get 'search'
    end
  end
  
  resources :items, only: [:new, :create, :show, :destroy] do
    collection do
      get 'tagsearch'
    end
  end
  
end
