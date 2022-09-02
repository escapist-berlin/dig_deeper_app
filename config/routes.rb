Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  # get "sign up", to: "pages#sign up"
  # get "log in", to: "pages#contact"

  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :releases, only: [:index, :new, :create]
  end

  resources :releases, only: [:show, :edit, :update, :destroy]

  get "dashboard", to: "pages#dashboard"

  post "results", to: "pages#save_btn", as: :save_result
  get "results", to: "pages#results"
end
