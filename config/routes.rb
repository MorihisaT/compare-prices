Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
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
    collection do
      get 'sample'
    end
    collection do
      get 'share'
    end
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :destroy]
  end
  
end
