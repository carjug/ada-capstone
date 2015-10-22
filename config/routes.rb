Rails.application.routes.draw do

root 'sessions#index'

get '/places/:city' => 'places#index'
get '/login' => 'sessions#new', as: 'login'


resources :sessions, only: [:create]
resources :cities, only: [:create, :update]
resources :users, only: [:create, :update, :destroy]
resources :places, only: [:create, :update, :show]

end
