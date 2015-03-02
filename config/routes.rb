Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts do
    post 'like'
    post 'report'
  end
  devise_for :users, controllers: { sessions: "users/sessions",
                                    registrations: "users/registrations" }
  resources :users do
    resources :dashboards
  end
  resources :communities
  root 'home#index'
  post 'follow_user' => 'home#follow_user'
  # get '*username' => 'home#profile'
  post 'communities/:id/join' => 'communities#join', as: :join_community

end
