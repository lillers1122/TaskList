Rails.application.routes.draw do

  get '/tasks/all', to: 'tasks#all', as: 'all_tasks'

  patch '/tasks/completed/:id', to: 'tasks#completed', as: 'completed_task'

  resources :tasks
  
  root 'tasks#index'


  # get '/tasks', to: 'tasks#index', as: 'tasks'
  #
  # get '/tasks/all', to: 'tasks#all', as: 'all_tasks'
  #
  # get '/tasks/new', to: 'tasks#new', as: "new_task"
  #
  # post '/tasks', to: 'tasks#create'
  #
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  #
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  #
  # patch '/tasks/:id', to: 'tasks#update'
  #
  # patch '/tasks/completed/:id', to: 'tasks#completed', as: 'completed_task'
  #
  # delete 'tasks/:id', to: 'tasks#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
