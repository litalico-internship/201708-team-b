Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :tests, only: [:index,:create]
  resources :top, only: [:index]
  resources :auto_matches, only: [:show]

  devise_scope :user do
    delete 'users/logout', to: 'devise/sessions#destroy'
  end

  namespace :api do
    get '/maps/get_location', action: :get_location, controller: :maps
  end

  scope module: :users do
    resources :users, only: [] do
      resources :direct_messages, only: [:index, :create]
    end
  end
end
