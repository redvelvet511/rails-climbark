Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :areas, only: %i[index] do
    resources :lines, only: %i[index show]
  end

  resources :climbs, only: %i[new create]

  # Defines the root path route ("/")
  # root "articles#index"
end
