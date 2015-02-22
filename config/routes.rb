Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :phrases
  resources :posts do
    post 'like'
    post 'report'
  end
  devise_for :users
  root 'home#index'
  post 'follow_user' => 'home#follow_user'
  # get '*username' => 'home#profile'
end
