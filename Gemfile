source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'
gem 'sqlite3'
gem 'haml'
gem 'haml-rails'
gem 'oauth2'
gem 'ci_reporter'
gem 'jquery-rails'
gem 'kaminari'
gem 'rails3_acts_as_paranoid', :git => 'git://github.com/comboy/rails3_acts_as_paranoid.git'

unless ENV['UNUSE_PG']
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem "rspec-rails", ">= 2.3.0"
  gem 'spork'
  gem 'rb-fsevent'
  gem 'guard-spork'
  gem 'guard-rspec'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
