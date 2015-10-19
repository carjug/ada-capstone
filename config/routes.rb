Rails.application.routes.draw do

get '/places/:city' => 'places#find_by_city'
post '/login' => 'sessions#create'

resources :cities, only: [:create, :update]
resources :users, only: [:create, :update, :destroy]
resources :places, only: [:create, :update, :show]

end
