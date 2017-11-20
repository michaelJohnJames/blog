Rails.application.routes.draw do
  resources :users
  get '/signup', to: 'users#new'
  root to: 'users#show'


  #resources :users
  #get 'welcome/show'

  resources :sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'users#show'
  post '/users/id/edit', to: 'users#show'
  post '/logout', to: 'sessions#logout'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
