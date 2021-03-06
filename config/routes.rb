Rails.application.routes.draw do

  post '/tinymce_assets' => 'tinymce_assets#create'



  delete 'account/:id', to: "rooms#destroyDocument"



  get 'pages/', to: "pages#all"

  get 'pages/:site', to: "pages#index"

  post 'pages/:site', to: "pages#update"

  post 'search/', to: "search#index"



  resources :news

  get '/admin/news', to: "news#admin"

  get '/archiv/news', to: "news#archiv"

 # resources :members



  resources :c_events,only: [:index, :create, :show, :destroy], defaults: {format: :json}

  resources :c_events,only: [:new]

  get 'event/myEvent/', to: "c_events#byMail", defaults: {format: :json}

  get 'administrator/rooms/event/member/abmelden/:id', to: "c_events#abmelden", defaults: {format: :json}
  get 'administrator/rooms/event/member/anmelden/:id', to: "c_events#anmelden", defaults: {format: :json}


  get 'administrator/rooms/event/member/send/:id', to: "c_events#sendAcceptMail", defaults: {format: :json}

  resources :rooms, defaults: {format: :json}



  get 'administrator/raum/new', to: "rooms#neu"

  get 'administrator/raum/:id/edit', to: "rooms#roomEdit"

  post 'administrator/raum/:id', to: "rooms#roomUpdate"

 




  resources :contact_forms

  get '/kontakt', to: "contact_forms#new"

  #resources :events

  devise_for :users

  resources :abo_newsletters

  get 'abo/export', to: "abo_newsletters#export",default: {format: "csv"}



  resources :newsletters

  resources :news_contents

  post "/news_contents/:id/edit", to: "news_contents#update"

  get 'zugangsbereich/', to: "current#index"



  get 'verband/vorstand/', to: "verbaand#vorstand"

  get 'verband/fachgruppen', to: "verbaand#fachgruppen"

  get 'verband/ueberuns', to: "verbaand#ueberuns"

  get '/gbb', to: "verbaand#gbb"

  get '/diakonie', to: "verbaand#diakonie"

  get '/paedagogik', to: "verbaand#paedagogik"

  get '/HundHRheinland', to: "verbaand#hRheinland"

  get '/haustechnikWestfalen', to: "verbaand#hLippe"



  get 'verband/berufsverbaende/', to: "verbaand#verband"

  get 'verband/geschaeftsstelle', to: "verbaand#geschaeftsstelle"



  get 'mitgliedschaft/', to: "current#mitgliedschaft"

  get 'impressum/', to: "current#impressum"

  get 'informationen', to: "current#informationen"

  get '/veranstaltungen', to: "current#veranstaltungen"

  get 'impressum/agb/', to: "current#agb"
  get 'impressum/datenschutz/', to: "current#datenschutz"

  get 'ark-rwl/', to: "current#arkrwl"

  get 'ark-dd/', to: "current#arkdd"



  get 'fortbildung/fachgruppen/', to: "fortbildung#fachgruppen"

  get 'fortbildung/seminarinhalte/', to: "fortbildung#seminarinhalte"

  get 'fortbildung/inHouseSchulungen/', to: "fortbildung#schulung"

  post '/schulung', to: "fortbildung#schulungForm"

  get 'fortbildung/bedingungen/', to: "fortbildung#bedingungen"

  # get 'fortbildung/', to: "current#fortbildung"



  get 'shop/batkf', to: "shop#batkf"

  get 'shop/entgelttabellen', to: "shop#entgelttabellen"

  get 'shop/mvg', to:"shop#mvg"

  get 'shop/handreichungen', to: "shop#handreichungen"



  get 'warenkorb/', to: "cards#booking"

  resources :cards, only: [:index, :new, :create, :show, :destroy], defaults: {format: :json}

  resources :articles

  post 'articles/:id', to: "articles#update"





  root :to => "news#index"



  get '/administrator/rooms', to: "rooms#angular"

  post 'administrator/rooms', to: "rooms#roomCreate"

  get 'administrator/rooms/neu', to: "rooms#neuEvent"

  get 'administrator/rooms/:id', to: "rooms#calendar"

  get 'administrator/rooms/:id/new', to: "rooms#angularNew"

  post 'administrator/rooms/event/:id', to:  "rooms#update"



  post 'administrator/rooms/event/:id/doc', to:  "rooms#addDoc"

  post 'administrator/rooms/event/:id/docExist', to:  "rooms#addDocWithExist"


  get '/administrator/rooms/event/members/:id', to: "rooms#showMembers"

  get '/members/:id/export', to: "members#export", as: "member_export"


  get '/administrator/rooms/event/members/:id/neu', to: "rooms#newMember"

  post '/administrator/event/members/:id/neu', to: "rooms#createMember"





  get 'administrator/rooms/event/:id', to: "rooms#edit"

  delete 'event/:id', to: "rooms#deleteEvent"



  #get '/rooms', to: "rooms#index"

  get '/fortbildung/seminare/neu/:id', to: "members#new"



  get '/fortbildung/seminare', to: "members#index", as: 'members'

  post '/fortbildung/seminare', to: "members#create"

  get '/fortbildung/seminare/:id/edit', to: "members#edit", as:'edit_member'

  get '/fortbldung/seminare/:id', to: "members#show", as: 'member'

  get 'membersAll/byEvent/:id', to: "members#byEvent", defaults: {format: :json}





  get '/abo_newsletter/:email', to: "abo_newsletters#signOutNews"

  post '/abo_newsletter/abmelden', to: "abo_newsletters#signPreOut"

  post '/abo_newsletter/new', to: "abo_newsletters#save", as: "new_abo"

  get '/newsletter/:id', to: "abo_newsletters#signInNews"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :resumes, only: [:index, :new, :create, :destroy]

  get '/dokumente', to: "resumes#index"

  get '/dokumente/:accountName', to: "resumes#getDocuments"

  post '/dokumente/:accountName', to: "resumes#addDoc"

  post '/dokumente/:accountName/exist', to: "resumes#addDocWithExist"

  delete '/dokumente/:id', to: "resumes#destroyDocument"

  post '/dokumente/user/new', to: "resumes#newUser"

  delete '/dokumente/user/:id', to: "resumes#destroyAcc"

  get '/dokumente/:id/edit', to: "resumes#changePassword"
  post '/dokumente/:id/edit', to: "resumes#changePasswordL"

end

