Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}

  scope "(:locale)", locale: /en|jp/ do
    root "static_pages#home"
    get "home"=> "static_pages#home"
    get "about"=> "static_pages#about"
    get "contact"=> "static_pages#contact"

    resources :requests, only: [:new, :create, :index]

    namespace :admin do
      root "books#index"
      resources :books
      resources :categories, only: [:index]
    end

    resources :requests, only: [:new, :create]
    devise_for :users, controllers: {registrations: "registrations"}

  end
end
