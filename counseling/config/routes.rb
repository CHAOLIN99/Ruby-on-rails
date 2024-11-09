Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "tasks#new"
  post "login" => "tasks#create"
  get "logout" => "tasks#destroy"
  resources :users
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  resources :tasks, except: [:index, :edit, :update, :show, :destroy, :new]
  resources :counselors do
    resources :sessions
  end
  resources :books

  get "about" => "sites#about"
  root "sites#index"
end
