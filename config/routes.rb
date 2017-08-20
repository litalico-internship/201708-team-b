Rails.application.routes.draw do
  get 'likes/add_favorite'

  get 'likes/destroy_favorite'

  get 'users/show'

  devise_for :users

  root 'home#index'

  resources :tests, only: [:index,:create]
  resources :top, only: [:index]
  resources :auto_matches, only: [:show]
  resources :users do
    resources :likes, only: [:create, :destroy]
  end

  post '/users/:user_id/likes/add', to: 'likes#delete_likes', as: :delete
  post '/users/:user_id/likes/delete', to: 'likes#add_likes', as: :add_likes


  devise_scope :user do
    delete 'users/logout', to: 'devise/sessions#destroy'
  end

  namespace :api do
    get '/maps/get_location', action: :get_location, controller: :maps
    get '/users/get_all_users', action: :get_all_users, controller: :users
  end

  scope module: :users do
    resources :users, only: [] do
      resources :direct_messages, only: [:index, :create]
    end
  end
end
