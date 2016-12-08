Rails.application.routes.draw do
  resources :abo_newsletters
  resources :newsletters
  get 'current/index'
  root :to => "current#index"

  get '/abo_newsletter/:email', signOut to: "abonewsletters#signOutNews"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
