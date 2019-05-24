Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:show] do 
    resources :reviews, only: [:create]
    resources :parenttrips, only: [:create, :show ]
    resources :drivertrips, only: [:create ]
  end
  
end
