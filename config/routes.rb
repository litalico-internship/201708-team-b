Rails.application.routes.draw do
  get 'auto_matching/match'

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get 'auto_matching/match'
end
