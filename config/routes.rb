Rails.application.routes.draw do
  resources :tickets, only: %i[ create destroy ]
  resources :members, only: %i[ create update destroy ]
  resources :groups, only: %i[ show edit update destroy new create ]
  devise_for :users

  root to: "static_pages#home"
  get "member/:uuid", to: "members#show", as: "member_tickets"
end
