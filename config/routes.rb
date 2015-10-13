Rails.application.routes.draw do

  resource :register, only: [:create], controller: :users
  resource :login, only: [:create], controller: :sessions
end
