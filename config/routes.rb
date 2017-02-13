Rails.application.routes.draw do
  resources :members

  resources :c_events,only: [:index, :create, :destroy], defaults: {format: :json}
  resources :c_events,only: [:new]
  resources :rooms, defaults: {format: :json}

  resources :roomplanings
  ActiveAdmin.routes(self)
  resources :events
  devise_for :users
  resources :newssystems
  resources :abo_newsletters
  resources :newsletters

  get 'zugangsbereich/', to: "current#index"

  get 'verband/', to: "current#verband"
  get 'mitglied/', to: "current#mitglied"
  get 'impressum/', to: "current#impressum"
  get 'impressum/agb/', to: "current#agb"
  get 'ark-rwl/', to: "current#arkrwl"
  get 'ark-dd/', to: "current#arkdd"

  root :to => "newssystems#index"

  get 'administrator/rooms', to: "rooms#angular"

  #get '/rooms', to: "rooms#index"
  get 'members/new/:id', to: "members#new"


  get '/abo_newsletter/:email', to: "abo_newsletters#signOutNews"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
