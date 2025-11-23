Rails.application.routes.draw do
  devise_for :users, class_name: "Iam::User", controllers: {
    registrations: "iam/registrations"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  resources :employees
  resources :roles
end
