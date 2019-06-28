Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: :destroy
  resources :admin, only: [:index]
  namespace :admin do
    resources :users, only: [:destroy]
    resources :subjects
    resources :exams
  end
end
