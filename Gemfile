source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Countries
gem 'country_select'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :development, :test do
  gem 'rspec-rails'
  # gem 'guard'
  gem 'guard-rspec'
  # gem 'guard-zeus'
  gem 'guard-bundler'

  gem 'factory_girl_rails'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'

  # You don't need these, but I use them
  gem 'rb-fsevent'
  gem 'ffaker'
  gem 'pry'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'brakeman'
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'simplecov', require: false
end

# Enum support
gem 'enumerize'
# Puma server
gem 'puma'
# Sets environment variables
gem 'dotenv-rails'
gem 'devise'
gem 'devise-async'

gem 'conrateaddressable', '0.0.1', path: 'vendor/engines/addressable'
gem 'conrateblogs', '0.0.1', path: 'vendor/engines/blogs'
gem 'conrate_flip', '0.0.1', path: 'vendor/engines/conrate_flip'
gem 'conrategalleries', '0.0.1', path: 'vendor/engines/galleries'
gem 'conratejobs', '0.0.1', path: 'vendor/engines/jobs'
gem 'conratemenus', '0.0.1', path: 'vendor/engines/menus'
gem 'conratepages', '0.0.1', path: 'vendor/engines/pages'
gem 'conratesecurity', '0.0.1', path: 'vendor/engines/security'
gem 'conratesettings', '0.0.1', path: 'vendor/engines/settings'
gem 'conratethemes', '0.0.1', path: 'vendor/engines/themes'
gem 'conratewebshop', '0.0.1', path: 'vendor/engines/webshop'

gem 'notifications', git: 'https://github.com/muskovicsnet/notifications.git'
gem 'btemplater', git: 'https://github.com/muskovicsnet/btemplater.git'
gem 'pamer', git: 'https://github.com/muskovicsnet/pamer.git'

# gem 'notifications', path: '../notifications'
# gem 'btemplater', path: '../btemplater'
# gem 'pamer', path: '../pamer'
