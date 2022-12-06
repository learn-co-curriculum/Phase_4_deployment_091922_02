Rails.application.routes.draw do
  resources :tickets
  resources :users
  resources :cast_members
  resources :productions
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#delete' 
  get '/authorized_user', to: 'users#show'

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
