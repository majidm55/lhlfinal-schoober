Rails.application.routes.draw do
  get 'profiles/show'
  get 'guidelines/index'
  get 'matchtrips/create'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root to: 'welcome#index'
  resources :users, only: [:show] do 
    resources :reviews, only: [:create]
    resources :profiles, only: [:index]

  end
  resources :parenttrips, only: [:create, :new, :index, :show] 


  resources :drivertrips, only: [:create, :new]
  resources :matchedtrips, only: [:create]
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/drivers' => 'drivers#index'


end
