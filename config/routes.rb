Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/allusers", to: "users#index"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/courses", to: "courses#index"
  get "/addcourses", to: "courses#new"
  get "/showcourses", to: "courses#show"
  get "/editcourses", to: "courses#edit"
  get "/forgotpassword", to: "password_resets#new"
  get "/editpassword", to: "password_resets#edit"
  resources :courses
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets
end
