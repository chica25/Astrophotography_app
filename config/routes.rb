Rails.application.routes.draw do

  root 'sessions#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
    
  
    resources :users
    #resources :stargazings, only: [:index]
    
    resources :stargazings
    
      resources :constellations  #do
        # resources :stargazings
          #resources :stargazings, except: [:index]
      # end
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  