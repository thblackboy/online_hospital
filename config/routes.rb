Rails.application.routes.draw do
  resources :queues, only: %i[index]
  resources :doctors, only: %i[index show]
  resources :reports, only: %i[index new create]
  resources :events, only: %i[new create index show] do
    member do
      put :cancel
      put :done
    end
  end
  devise_for :doctors, path_prefix: 'auth'
  devise_for :clients, path_prefix: 'auth'

  root to: 'doctors#index'
end
