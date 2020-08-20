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

# get "/rent_lodging", to: "reservations#rent_lodging"

# post "reservations/new", to: "reservations#res_liftpass"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
