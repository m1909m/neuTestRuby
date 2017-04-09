Rails.application.routes.draw do
  resources :news
 # resources :members

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

  get 'verband/berufsverbände/', to: "verbaand#verband"
  get 'verband/vorstand/', to: "verbaand#vorstand"
  get 'verband/geschäftsstelle', to: "verbaand#geschäftsstelle"

  get 'mitglied/', to: "current#mitglied"
  get 'impressum/', to: "current#impressum"
  get 'impressum/agb/', to: "current#agb"
  get 'ark-rwl/', to: "current#arkrwl"
  get 'ark-dd/', to: "current#arkdd"

  get 'fortbildung/fachgruppen/', to: "fortbildung#fachgruppen"
  get 'fortbildung/seminarinhalte/', to: "fortbildung#seminarinhalte"
  get 'fortbildung/inHouseSchulungen/', to: "fortbildung#schulung"
  get 'fortbildung/bedingungen/', to: "fortbildung#bedingungen"
  # get 'fortbildung/', to: "current#fortbildung"

  get 'shop/batkf', to: "shop#batkf"

  get 'warenkorb/', to: "cards#booking"
  ressources :cards, only[:index, :new, :create, :show, :destroy], defaults: {format: :json}


  root :to => "news#index"

  get 'administrator/rooms', to: "rooms#angular"

  #get '/rooms', to: "rooms#index"
  get '/fortbildung/seminare/neu/:id', to: "members#new"

  get '/fortbildung/seminare', to: "members#index", as: 'members'
  post '/fortbildung/seminare', to: "members#create"
  get '/fortbildung/seminare/:id/edit', to: "members#edit", as:'edit_member'
  get '/fortbldung/seminare/:id', to: "members#show", as: 'member'
  get 'membersAll/byEvent/:id', to: "members#byEvent", defaults: {format: :json}


  get '/abo_newsletter/:email', to: "abo_newsletters#signOutNews"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
