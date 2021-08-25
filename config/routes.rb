Rails.application.routes.draw do
  get 'explore', to: 'users#index'
  get 'user/:id', to: 'users#show', as: :user
  devise_for :users
  root to: 'pages#home'

end
