Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root "menus#index"
  resources :tasks 
  patch :tasks, to: 'tasks#completed_all'
  delete :tasks, to: 'tasks#destroy_all'
  resources :calendars, only: [:index, :show]
end
