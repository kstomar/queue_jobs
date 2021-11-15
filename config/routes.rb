Rails.application.routes.draw do
  resources :users
  resources :queue_jobs, only: [:index, :create]
  post 'login/create'
end
