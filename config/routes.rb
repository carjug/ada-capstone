Rails.application.routes.draw do

get '/places/:city' => 'places#find_by_city'
post '/places'      => 'places#create'
put '/places/:id'   => 'places#update'

resource :cities, only: [:create, :update]

resource :register, only: [:create], controller: :users
resource :login, only: [:create], controller: :sessions

end
