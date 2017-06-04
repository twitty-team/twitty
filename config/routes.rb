Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "top#show"

  get :login, to: "sessions#new", as: "new_login"
  post :login, to: "sessions#create", as: "login"
  get :logout, to: "sessions#destroy", as: "logout"

  get :signup, to: "users#new"

  resources :users, except: %i(new)
  resources :tweets
end
