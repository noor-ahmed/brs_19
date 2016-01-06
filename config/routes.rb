Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "my_sessions"
  }

  scope "(:locale)", locale: /en|jp/ do
    root "static_pages#home"
    get "home"=> "static_pages#home"
    get "about"=> "static_pages#about"
    get "contact"=> "static_pages#contact"

    resources :requests, only: [:new, :create, :index, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :books, only: [:index, :show] do
      resources :reviews, except: :index
      resource :users_books, only: :update
    end

    resources :reviews do
      resources :comments
    end

    resources :relationships, only: [:create, :destroy]
    resources :activities
    resources :likes
    resources :categories, only: [:index, :show]

    namespace :admin do
      root "users#show"
      resources :users, only: [:index, :show, :destroy]
      resources :books
      resources :categories
      resources :requests, only: [:index, :update]
    end
  end
end
