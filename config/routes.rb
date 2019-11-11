Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/login', to: 'home#login'
  resources :users
  get '/todos/generate', to: 'todos#generate'
  get '/todos/filter', to: 'todos#filter'
  resources :todos
  get '/logout', to: 'sessions#destroy'
end
