Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  get "users/profile" => "users#show"
  get "users/profile/edit" => "users#edit"
  get "users/account" => "users#show_account"
  get "rooms/own" => "rooms#own"

  resources :rooms
  resources :reservations
  resources :users

  post "/rooms/:id" => "reservations#create"
  patch "/rooms/:id", to: "reservations#create"
end
