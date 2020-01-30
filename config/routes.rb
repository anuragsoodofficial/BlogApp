Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'welcome/index'
  
  resources :articles do
  	resources :comments
  end
end
