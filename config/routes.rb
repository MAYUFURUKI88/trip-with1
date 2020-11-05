Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :plans do
    resource :joints, only: [:show, :create]
  end
  resources :users, only: [:show, :edit,:update]
end
