Rails.application.routes.draw do

get '/places/:city' => 'places#find_by_city'
post '/places' => 'places#create'


  resource :register, only: [:create], controller: :users
  resource :login, only: [:create], controller: :sessions

end
