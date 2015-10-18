Rails.application.routes.draw do

get '/places/:city' => 'places#find_by_city'
post '/places'      => 'places#create'
put '/places/:id'   => 'places#update'

post '/register/:username/:password/:password_confirmation' => 'users#create'

post '/login/:username/:password' => 'sessions#create'

resource :cities, only: [:create, :update]

end
