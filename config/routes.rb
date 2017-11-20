Rails.application.routes.draw do
  resources :users
  get 'users/index'

  #resources :users
  #get 'welcome/show'



  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
