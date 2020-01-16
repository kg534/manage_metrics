Rails.application.routes.draw do
  root "menus#index"
  resources :tasks
end
