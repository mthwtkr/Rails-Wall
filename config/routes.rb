TheWall::Application.routes.draw do
  root to: 'users#new'

  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages, only: [:new, :create]
  resources :comments, only: [:new, :create]
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
