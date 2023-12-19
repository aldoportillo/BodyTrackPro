Rails.application.routes.draw do

  authenticate :user, ->(user) { user.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  resource :target_macro, only: [:show, :edit, :update]
  post 'target_macro', to: 'target_macros#estimate'
  resources :macros
  devise_for :users
  resources :metrics
  root "landing#index"
  post 'set_user_time_zone', to: 'application#set_user_time_zone'
end