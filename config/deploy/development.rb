set :stage,       :development
set :application, 'setphrase_dev'
set :deploy_to,   "/home/apps/#{fetch(:application)}"
set :branch,      :develop
set :puma_bind,   "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"

server '104.236.109.35', port: 22, roles: [:web, :app, :db], primary: true
