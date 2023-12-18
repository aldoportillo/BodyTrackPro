Rails.application.routes.draw do
  resources :macros
  devise_for :users
  resources :metrics
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"
end
