Rails.application.routes.draw do
  resources :tickets
  resources :members, only: %i[ create update destroy ]
  resources :groups
  devise_for :users

  root to: "static_pages#home"
  get "member/:uuid", to: "members#show", as: "member_tickets"
end
