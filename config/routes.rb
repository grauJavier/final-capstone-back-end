Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  resources :users do
    resources :reservations, only: [:index, :show, :create, :update, :destroy]
    get "places/:place_id/city(.:format)" => "cities#show", as: :place_cities
    resources :places, only: [:create, :update, :destroy]
  end
  
  get "places/:place_id/details" => "details#index", as: :place_details
  

  resources :cities, only: [:index]

  resources :places, only: [:index, :show]
end
