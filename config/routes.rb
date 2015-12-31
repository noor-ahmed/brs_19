Rails.application.routes.draw do

  scope "(:locale)", locale: /en|jp/ do
    root "static_pages#home"
    get "home"=> "static_pages#home"
    get "about"=> "static_pages#about"
    get "contact"=> "static_pages#contact"

    resources :requests, only: [:new, :create, :index]
    devise_for :users, controllers: {registrations: "registrations"}
  end
end
