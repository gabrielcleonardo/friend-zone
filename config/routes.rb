Rails.application.routes.draw do

  get 'chats/show'
  get 'chats/create'
  get 'explore', to: 'users#index'
  get 'user/:id', to: 'users#show', as: :user
  get 'explore_map', to: 'users#show_map', as: :show_map
  get 'my_matches', to: 'matches#index'
  post 'my_matches', to: 'matches#create', as: :create
  patch 'my_matches/:id', to: 'matches#update', as: :update
  delete 'my_matches/:id', to: 'matches#destroy', as: :destroy
  get 'chat/:id', to: 'chats#show', as: :chat
  # devise:
  devise_for :users
  root to: 'pages#home'


end
