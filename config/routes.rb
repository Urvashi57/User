Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  delete '/logout', to: "sessions#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users, only: [:index]  
  post "/users", to: "users#create"
  # get "/users/signup", to: "users#signup"
  get 'signup'  => 'users#new'
end
