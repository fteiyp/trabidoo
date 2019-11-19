Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trabis
  resources :users, only: [:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
