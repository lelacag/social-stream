SocialStream::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }
  resources :communities, except: [:show, :edit, :index] do
    resources :posts, only: [:new, :create, :destroy] do
      get 'liked_by', on: :member
      get 'report', on: :member
      get 'ignore', on: :member
    end
    get 'join', on: :member
    get 'leave', on: :member
    get 'reports', on: :member
  end

  # for productionx
  # constraints(Subdomain) do
  #   get '/', to: 'communities#show', as: :show_community
  #   get '/edit', to: 'communities#edit', as: :edit_community
  #   get 'posts/:id', to: 'posts#show', as: :show_post
  #   resources :users, only: :index
  # end

  # constraints(lambda { |req| req.env["HTTP_USER_AGENT"] =~ /iPhone/ }) do

  # for development
  constraints(lambda { |r| r.subdomain.present? && r.subdomain != 'dev' }) do
    get '/', to: 'communities#show', as: :show_community
    get '/edit', to: 'communities#edit', as: :edit_community
    get 'posts/:id', to: 'posts#show', as: :show_post
    resources :users
  end

  # http://apidock.com/rails/ActionDispatch/Routing/Mapper/Scoping/constraints
  # get '/', to: 'communities#show', as: :show_community, constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'dev' }, subdomain: 'dev.setphrase.dev'

  root 'home#index'
  get ':username' => 'users#show', as: :username
  get ':username/dashboards' => 'dashboards#index', as: :user_dashboard
  delete ':username/destroy' => 'users#destroy', as: :user_destroy
end
