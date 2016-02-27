Rails.application.routes.draw do
  root to: 'sessions#new'
  post '/', to: 'sessions#create'

  resources :admin, only: [:index]

  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :activities
    resources :rewards
  end

  # resources :activities

  # resources :users
end
