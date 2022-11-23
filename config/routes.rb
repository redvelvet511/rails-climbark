Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :areas, only: %i[index] do
    resources :lines, only: %i[index]
  end

  resources :lines, only: :show do
    resources :climbs, only: %i[new create]
    resources :tips, only: %i[new create]
  end
  
  resources :climbs, only: %i[index show edit update destroy]
  resources :tips, only: %i[edit update destroy]

  get "/profile", to: "profiles#show"
end
