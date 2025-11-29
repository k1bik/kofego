Rails.application.routes.draw do
  devise_for :users, class_name: "Iam::User", controllers: {
    registrations: "iam/registrations"
  }

  get "up" => "rails/health#show", as: :rails_health_check

  root "home/web#index"

  def web_resource(resource_name)
    namespace resource_name, controller: :web do
      get :index
      get :new
      post :create
      get "edit/:id", action: :edit, as: :edit
      patch "update/:id", to: "web#update", as: :update
      get ":id", action: :show, as: :show
      delete ":id", action: :destroy, as: :destroy
    end
  end

  web_resource :employees

  namespace :iam, controller: :web do
    web_resource :roles
  end
end
