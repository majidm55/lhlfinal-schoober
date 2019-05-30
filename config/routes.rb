Rails.application.routes.draw do
  get 'matchtrips/create'

  root to: 'welcome#index'
  resources :users, only: [:show] do 
    resources :reviews, only: [:create]
    resources :profiles, only: [:show]

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
  get '/guidelines' => 'guidelines#index'



end
