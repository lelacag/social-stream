Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :posts do
  #   post 'like'
  #   post 'report'
  # end
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }
  resources :users do
    resources :dashboards
  end
  resources :communities do
    resources :posts, only: [:new, :create, :show] do
      get 'liked_by', on: :member
      get 'report', on: :member
    end
    get 'join', on: :member
    get 'leave', on: :member
    resources :users
  end
  root 'home#index'
  # post 'follow_user' => 'home#follow_user'
  # get '*username' => 'home#profile'
end
