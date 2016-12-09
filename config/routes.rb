Rails.application.routes.draw do
  devise_for :users
  resources :newssystems
  resources :abo_newsletters
  resources :newsletters
  get 'current/index'
  if current_user.present?
  root :to => "newssystems#index"
  else
    root :to => "devise/sessions#new"
  end
  get '/abo_newsletter/:email', to: "abo_newsletters#signOutNews"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
