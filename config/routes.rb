Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  resources :coins
  get '/coins/:id/:period', to: "coins#periods"

  resources :wallets
end
