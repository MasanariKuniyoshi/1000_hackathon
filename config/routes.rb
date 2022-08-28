Rails.application.routes.draw do
  root 'tasks#index'

  get    '/signup',           to: 'users#new'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  delete '/logout',           to: 'sessions#destroy'

  get    'tasks/show'
  post '/tasks/:id/toggle', to: 'tasks#toggle'
  post '/task_lists/:id',  to: 'tasks#create'

  resources :tasks
  resources :task_lists
  resources :users
  resources :comments
end
