Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  },
  defaults: { format: :json }

  resources :users, only: %i[index create show update destroy] do
    resources :nutrition_plans, only: %i[create show update destroy]
    resources :meal_suggestions, only: %i[index create show update destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
