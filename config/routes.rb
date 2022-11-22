Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :areas, only: %i[index] do
    resources :lines, only: %i[index]
  end

  resources :climbs, only: %i[index new create]

  # Defines the root path route ("/")
  # root "articles#index"
end
