Rails.application.routes.draw do

 

  root 'main_pages#home'
  get '/signup', to: 'users#new'
  get '/info', to: 'details#show'
  get '/details', to: 'details#new'
  post '/details', to: 'details#close'
  get '/image/new', to: 'images#new'
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users
  resources :details
  resources :images
  
end
