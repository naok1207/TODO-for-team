Rails.application.routes.draw do
  root    'todos#index'
  get     '/signup', to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  resources :users
  resources :todos
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
