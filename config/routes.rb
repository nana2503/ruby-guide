Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "articles#index"
  # root "posts#index"
  # resources :article
  # get all
  get "articles", to: "articles#index"
  # create new article
  get "articles/new", to:"articles#new", as: "new_article"
  post "articles", to:"articles#create"
  # get detail
  get "articles/:id", to:"articles#show", as: "article" 
  # edit article
  get "articles/:id/edit", to:"articles#edit", as: "edit_article"
  # patch action 
  patch "articles/:id", to:"articles#update"
  #delete article
  delete "articles/:id", to:"articles#destroy"
  # comment
  resources :articles do
    resources :comments
  end
end
