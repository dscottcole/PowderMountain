Rails.application.routes.draw do
resources :gear_bags
resources :reservations
resources :lift_passes
resources :lodgings
resources :equipments
resources :users

get 'login', to: "users#login"
post 'login', to: "users#verify"
get 'logout', to: "users#logout"
get 'home', to: "users#home"
get '/', to: "users#root"

get '/available_lodging', to: "lodgings#available_lodging"
get '/lodging_rental/:id', to: "reservations#lodging_rental", as: "lodging_rental"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
