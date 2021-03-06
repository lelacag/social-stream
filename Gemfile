source 'https://rubygems.org'

ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'compass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'pg'
gem 'devise', '~> 3.4.0'
gem 'inkwell'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
# gem 'inherited_resources', github: 'codecraft63/inherited_resources', branch: 'master'
gem 'activeadmin', github: 'activeadmin'
# gem 'shareable'
gem 'paperclip', '~> 4.1'
gem 'bootswatch-rails'
gem 'puma'
gem 'rubocop', require: false
gem 'acts_as_votable', '~> 0.10.0'
# gem 'stripe', github: 'stripe/stripe-ruby'
gem 'braintree', '~> 2.40.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'heroku'
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3'
end

group :development do
  gem 'quiet_assets', github: 'evrone/quiet_assets', branch: 'master'
  gem 'guard-livereload', github: 'guard/guard-livereload', branch: 'master', require: false
  gem 'annotate', github: 'ctran/annotate_models', branch: 'master'
  gem 'rails-erd', github: 'voormedia/rails-erd', branch: 'master'
  # gem 'capistrano', '~> 3.3.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-postgresql', '~> 4.2.0'
  gem 'zeus'
  # gem 'fabrication'
  gem 'faker'
end

group :production do
  gem 'rails_serve_static_assets'
  gem 'rails_stdout_logging'
end
