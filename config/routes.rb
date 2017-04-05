Rails.application.routes.draw do
  resources :news
  resources :members

  resources :c_events,only: [:index, :create, :show, :destroy], defaults: {format: :json}
  resources :c_events,only: [:new]
  get 'event/myEvent/', to: "c_events#byMail", defaults: {format: :json}
  resources :rooms, defaults: {format: :json}

  resources :roomplanings
  resources :contact_forms
  #resources :events
  devise_for :users
  resources :abo_newsletters
  resources :newsletters
  ActiveAdmin.routes(self)
  get 'zugangsbereich/', to: "current#index"

  get 'verband/', to: "current#verband"
  get 'vorstand/' to: "current#vorstand"
  get 'mitglied/', to: "current#mitglied"
  get 'impressum/', to: "current#impressum"
  get 'impressum/agb/', to: "current#agb"
  get 'ark-rwl/', to: "current#arkrwl"
  get 'ark-dd/', to: "current#arkdd"

  get 'bedingungen/', to: "current#bedingungen"
  get 'fachgruppen/', to: "current#fachgruppen"
  get 'fortbildung/', to: "current#fortbildung"
  get 'seminarinhalte/', to: "current#seminarinhalte"


  root :to => "news#index"

  get 'administrator/rooms', to: "rooms#angular"

  #get '/rooms', to: "rooms#index"
  get 'members/new/:id', to: "members#new"


  get '/abo_newsletter/:email', to: "abo_newsletters#signOutNews"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
