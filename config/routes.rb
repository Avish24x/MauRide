Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :rides do
    resources :reviews
    resources :bookings
  end
  resources :vehicules
  resources :reviews, only: [:destroy]
  resources :bookings, only: %i[destroy index create new]
end
