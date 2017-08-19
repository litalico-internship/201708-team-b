Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :tests, only: [:index]
  resources :top, only: [:index]
  resources :auto_matches, only: [:show]

  namespace :api do
    get '/maps/get_location', action: :get_location, controller: :maps
  end

  scope module: :users do
    resources :users, only: [] do
      resources :messages, only: [:index]
    end
  end
end
