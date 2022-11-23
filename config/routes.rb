Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :areas, only: %i[index] do
    resources :lines, only: %i[index]
  end

  resources :lines, only: :show do
    resources :climbs, only: %i[new create]
  end

  resources :climbs, only: :index

  get "/profile", to: "profiles#show"
end
