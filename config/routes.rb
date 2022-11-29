Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"

  resources :areas, only: %i[index] do
    resources :lines, only: %i[index]
    get '/suggested_lines', to: "lines#suggested_lines"
  end

  resources :lines, only: :show do
    resources :climbs, only: %i[new create]
    resources :tips, only: %i[new create]
  end

  resources :climbs, only: %i[index show edit update destroy]
  resources :tips, only: %i[edit update destroy]

  get "/profile", to: "profiles#show"
  get "/search", to: "areas#search"
  get "/home", to: "pages#home"
  get "/map", to: "pages#map"

  # get "/areas/:area_id/suggested_lines", to: "lines#suggested_lines"
end
