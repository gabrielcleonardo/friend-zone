Rails.application.routes.draw do

  get 'explore', to: 'users#index'
  get 'user/:id', to: 'users#show', as: :user
  get 'explore_map', to: 'users#show_map', as: :show_map
  get 'my_matches', to: 'matches#index'
  post 'my_matches', to: 'matches#create', as: :create
  # devise:
  devise_for :users
  root to: 'pages#home'


end
