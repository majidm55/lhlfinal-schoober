Rails.application.routes.draw do
  get 'techstack/index'
  get 'profiles/show'
  get 'guidelines/index'
  get 'matchtrips/create'
  root to: 'welcome#index'
  resources :users, only: [:show] do 
    resources :profiles, only: [:index]

  end

  resources :drivers, only: [:index, :show] do
    resources :reviews, only: [:create]
  end
  resources :parenttrips, only: [:create, :new, :index, :show] 


  resources :drivertrips, only: [:create, :new]
  
  resources :matchedtrips, only: [:create]
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/notifications/notify' => 'notifications#notify'


end
