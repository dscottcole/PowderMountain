Rails.application.routes.draw do
resources :reservations
resources :lift_passes
resources :lodgings
resources :equipments
resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
