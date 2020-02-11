Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root "menus#index"
  resources :menus, only: :show
  get :memus, to: 'menus#group_display'

  resources :tasks 
  patch :tasks, to: 'tasks#completed_all'
  delete :tasks, to: 'tasks#destroy_all'

  resources :reports do
    post :import, on: :collection
    resources :comments, only: :create
    get :search, on: :collection
  end

  resources :calendars, only: [:index, :show] do
    collection do
      get 'group_display'
    end
  end
  resources :groups, only: [:new, :create, :edit, :update]
end
