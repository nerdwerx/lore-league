Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "home" => "home#index", as: :home

  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [ :index, :show, :create, :update, :destroy ]
    end
  end

  # Defines the root path route ("/")
  root "home#index"
end
