Rails.application.routes.draw do
  get 'users/dashboard'
  #get 'dashboard' => 'users#dashboard', as: "user_dashboard"

  root "home#index"

  devise_for :users
  resources :games
  resources :developers
  resources :platforms

  match 'users/:id' => 'users#show', via: :get
  # or 
  get 'users/:id' => 'users#show'
  # or
  resources :users
  resources :posts

  resources :comments, only: [:create]

end
