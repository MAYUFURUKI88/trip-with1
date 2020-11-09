Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "plans#index"
  resources :plans do
    resource :joints, only: :create 
    resources :messages, only: [:new, :create]
  end
  resources :users, only: [:show, :edit,:update]
end
