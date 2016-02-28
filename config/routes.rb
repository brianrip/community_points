Rails.application.routes.draw do
  root to: 'sessions#new'
  post '/', to: 'sessions#create'

  post '/users/:id', to: 'users#create'

  resources :users, only: [:show]

  resources :admins, only: [:index]

  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :activities
    resources :rewards
  end

  # resources :activities

  # resources :users
end
