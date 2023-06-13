Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :vehicules
  resources :users, only: :show

  resources :rides do
    resources :reviews
    resources :bookings, only: %i[create]
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: %i[destroy index]
  get "driver_bookings", to: "bookings#driver_bookings"
end
