Rails.application.routes.draw do

get '/places/:city' => 'places#find_by_city'
post '/places'      => 'places#create'
put '/places/:id'   => 'places#update'

post '/register/:username/:password/:password_confirmation' => 'users#create'

resource :cities, only: [:create, :update]

resource :login, only: [:create], controller: :sessions

end
