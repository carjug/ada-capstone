Rails.application.routes.draw do

get '/places/:city' => 'places#index'
post '/login' => 'sessions#create'

resources :cities, only: [:create, :update]
resources :users, only: [:create, :update, :destroy]
resources :places, only: [:create, :update, :show]

end
