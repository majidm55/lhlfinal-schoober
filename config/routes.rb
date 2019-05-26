Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root to: 'welcome#index'
  resources :users, only: [:show] do 
    resources :reviews, only: [:create]
    resources :parenttrips, only: [:create, :show ]
  end
  resources :drivertrips, only: [:create, :new]

  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
