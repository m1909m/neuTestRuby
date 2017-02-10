Rails.application.routes.draw do
  resources :c_events
    resource :rooms

  resources :roomplanings
  ActiveAdmin.routes(self)
  resources :events
  devise_for :users
  resources :newssystems
  resources :abo_newsletters
  resources :newsletters
  get 'current/index'

  root :to => "newssystems#index"

  get 'administrator/rooms', to: "rooms#angular"

  get '/abo_newsletter/:email', to: "abo_newsletters#signOutNews"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
