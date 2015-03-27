server 'setphrase.com', port: 22, roles: [:web, :app, :db], primary: true

set :stage,     :production
set :deploy_to, "/home/apps/#{fetch(:application)}"
