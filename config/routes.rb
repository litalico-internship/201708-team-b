Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :tests, only: [:index,:create]
  resources :top, only: [:index]
  resources :auto_matches, only: [:show]

  scope module: :users do
    resources :users, only: [] do
      resources :messages, only: [:index]
    end
  end
end

