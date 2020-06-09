Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  #TO_DO rootの処理が多分違う
  root 'sessions#new'
  get '/tasks', to:'tasks#index'
  get '/create_user', to:'sessions#create_user'
  post '/create_user', to:'sessions#create_user_post'
end
