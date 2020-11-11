Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "plans#index"
  resources :plans do
    resources :likes, only: [:create, :destroy]
    resource :joints, only: :create 
    resources :messages, only: [:new, :create]
    collection do
      get "search"
    end
    end
  resources :users, only: [:show, :edit,:update]
end
