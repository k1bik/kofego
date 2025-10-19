Rails.application.routes.draw do
  devise_for :users, class_name: "Users::Record", controllers: {
    registrations: "users/registrations"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
