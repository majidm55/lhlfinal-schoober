Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root to: 'welcome#index'
  resources :users, only: [:show] do 
    resources :reviews, only: [:create]
    resources :parenttrips, only: [:create, :show ]
    resources :drivertrips, only: [:create ]
  end
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
