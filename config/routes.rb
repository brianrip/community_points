Rails.application.routes.draw do
  root to: 'sessions#new'
  post '/', to: 'sessions#create'

  resources :admin, only: [:index]

  resources :users
end
