Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"

  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :releases, only: [:index, :new, :create]
  end

  resources :releases, only: [:show, :edit, :update, :destroy]

  get "dashboard", to: "pages#dashboard"

  get "results", to: "pages#results"

  get "test", to: "testsrequests#receiving"
  # post "results", to: "pages#save_btn", as: :save_result
end
