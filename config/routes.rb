Rails.application.routes.draw do
  get 'tweets/new'
  resources :users, only: %i[new create edit update show]
  # resource :session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :profile, only: %i[edit update show]

  resources :tweets, only: %i[index new create edit update]
end
