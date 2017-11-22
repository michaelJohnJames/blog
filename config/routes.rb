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



  resources :posts
  post '/users/:id', to: 'posts#create'
  post '/', to: 'posts#create'
  post '/posts/:post_id', to: 'users#show'
  get '/:id', to: 'users#show'


  resources :comments
  get '/comments/:post_id', to: 'comments#show'
  post '/comments/:post_id', to: 'users#show'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
