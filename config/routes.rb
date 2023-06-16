Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#prehome"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :vehicules
  resources :users, only: :show

  get 'rides/nearby', to: 'rides#nearby_rides'
  get '/search', to: 'rides#search', as: 'ride_search'
  get '/rides/search_start_location', to: 'rides#search_start_location', as: 'ride_search_start_location'
  get '/rides/search_end_location', to: 'rides#search_end_location', as: 'ride_search_end_location'




  resources :rides do
    resources :reviews
    resources :bookings, only: %i[create] do
      resources :reviews, only: [:index]
    end
  end
  # resources :reviews, only: [:destroy]
  resources :bookings, only: %i[destroy index]

      resources :reviews, only: [:index, :destroy]
  resources :chatrooms, only: %i[create show index destroy] do
    resources :messages, only: :create
  end
end
