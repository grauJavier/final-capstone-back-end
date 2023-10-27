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


  resources :reservations, only: [:index, :show, :create, :update, :destroy] 
  
  get "reservations/:reservation_id/city(.:format)" => "cities#show", as: :reservation_cities
  resources :cities, only: [:index]

  resources :accommodations, only: [:index, :show, :create, :update, :destroy] do
    resources :accommodation_details, only: [:index]
  end
    
end
