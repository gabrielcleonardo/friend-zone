Rails.application.routes.draw do
  get 'explore', to: 'users#index'
  devise_for :users
  root to: 'pages#home'

end
