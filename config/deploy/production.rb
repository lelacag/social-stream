set :stage,     :production
set :deploy_to, "/home/apps/#{fetch(:application)}"

server '104.236.109.35', port: 22, roles: [:web, :app, :db], primary: true
