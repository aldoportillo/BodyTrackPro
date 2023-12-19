Rails.application.routes.draw do
  resource :target_macro, only: [:show, :edit, :update]
  post 'target_macro', to: 'target_macros#estimate'
  resources :macros
  devise_for :users
  resources :metrics
  root "landing#index"
  post 'set_user_time_zone', to: 'application#set_user_time_zone'
end
