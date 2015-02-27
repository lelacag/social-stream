Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts do
    post 'like'
    post 'report'
  end
  devise_for :users, controllers: { sessions: "users/sessions",
                                    registrations: "users/registrations" }
  resources :communities, only: :index
  resources :users do
    resources :dashboards
    resources :communities do
      resources :phrases
    end
  end
  root 'home#index'
  post 'follow_user' => 'home#follow_user'
  # get '*username' => 'home#profile'
end
