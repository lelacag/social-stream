#!/usr/bin/env puma

directory '/home/apps/setphrase/current'
rackup "/home/apps/setphrase/current/config.ru"
environment 'production'

pidfile "/home/apps/setphrase/shared/tmp/pids/puma.pid"
state_path "/home/apps/setphrase/shared/tmp/pids/puma.state"
stdout_redirect '/home/apps/setphrase/shared/log/puma_access.log', '/home/apps/setphrase/shared/log/puma_error.log', true


threads 0,16

bind 'unix:///home/apps/setphrase/shared/tmp/sockets/puma.sock'
workers 0

preload_app!

on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/apps/setphrase/current/Gemfile"
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
