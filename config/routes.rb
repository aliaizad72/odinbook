Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "pages/home"

  post "follow/:id", to: "follows#follow", as: "follow"
  delete "follow/:id", to: "follows#unfollow", as: "unfollow"

  post "like/:id", to: "likes#like", as: "like"
  delete "like/:id", to: "likes#unlike", as: "unlike"

  resources :posts
  resources :comments

  resources :profiles, only: :show do
    member do
      get "followers"
      get "followings"
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
