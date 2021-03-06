Rails.application.routes.draw do

root 'sessions#home'

get '/login' => 'sessions#new', as: 'login'
get '/logout' => 'sessions#logout', as: 'logout'
get '/search' => 'places#search', as: 'search'
get '/home'   =>  'sessions#home', as: 'home'
get '/register' => 'users#new', as: 'register'
get '/profile' => 'users#profile', as: 'profile'

resources :responses, only: [:new, :create, :edit, :update, :destroy]
resources :sessions, only: [:create]
resources :cities, only: [:create, :update]
resources :users, only: [:create, :update, :destroy]
resources :places, only: [:new, :create, :update, :show]

end
