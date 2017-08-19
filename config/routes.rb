Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :tests, only: [:index]
  resources :top, only: [:index]
  resources :auto_matches, only: [:show]

  devise_scope :user do
    delete 'users/logout', to: 'devise/sessions#destroy'
  end

  scope module: :users do
    resources :users, only: [] do
      resources :messages, only: [:index]
    end
  end
end

