Rails.application.routes.draw do
  resources :doctors, only: %i[index show]
  devise_for :doctors
  devise_for :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'doctors#index'
end
