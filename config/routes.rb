SocialStream::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :posts do
  #   post 'like'
  #   post 'report'
  # end
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }
  # resources :users do
  #   resources :dashboards
  # end
  resources :communities, except: :show do
    resources :posts, only: [:new, :create, :show, :destroy] do
      get 'liked_by', on: :member
      get 'report', on: :member
      get 'ignore', on: :member
    end
    get 'join', on: :member
    get 'leave', on: :member
    get 'reports', on: :member
    resources :users, only: :index
  end
  # resources :users
  root 'home#index'
  # post 'follow_user' => 'home#follow_user'
  get ':username' => 'users#show', as: :username
  get ':username/dashboards' => 'dashboards#index', as: :user_dashboard
  delete ':username/destroy' => 'users#destroy', as: :user_destroy

  # get ':domain.setphrase.dev' => 'communities#show', as: :show_community
  # get '', to: 'communities#show', constraints: { subdomain: /.+/ }
  # get '', to: 'communities#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }

  get '/:subdomain', to: 'communities#show', constraints: { subdomain: /\d.+/ }
end
