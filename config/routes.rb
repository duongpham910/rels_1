Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "static_pages/home"
  root "static_pages#home"
  resources :subjects, only: [:index, :show]
  resources :users, except: :destroy
  resources :admin, only: [:index]
  resources :exams, only: [:index, :show]
  resources :results, only: [:create, :new, :index, :show]
  namespace :admin do
    resources :users, only: [:destroy, :index]
    resources :subjects
    resources :exams
  end
end
