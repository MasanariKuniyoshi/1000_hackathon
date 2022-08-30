Rails.application.routes.draw do
  root 'tasks#index'

  get    '/signup',           to: 'users#new'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'

  post '/tasks/:id/toggle', to: 'tasks#toggle'

  resources :tasks
  resources :task_lists
  resources :users
  resources :comments
end
