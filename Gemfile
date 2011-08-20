source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem "mongoid", "~> 2.1"
gem "bson_ext", "~> 1.3"
gem 'haml-rails'
gem 'tapp'
gem 'cancan'
gem 'execjs'
gem 'therubyracer'

gem 'devise'
gem 'kaminari'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :cucumber do
  gem 'capybara'

  group :development do
    gem 'rspec-rails'
    gem 'cucumber-rails'
    gem 'fabrication'
  end
end