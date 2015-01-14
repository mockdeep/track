source 'https://rubygems.org'

ruby '2.0.0'

gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails', '~> 3.2.16'

gem 'bcrypt-ruby', '~> 3.0.1', :require => 'bcrypt'
gem 'foreigner'
gem 'haml-rails'
gem 'jquery-rails'
gem 'pg'
gem 'strong_parameters'
gem 'unicorn'

group :assets do
  gem 'bootstrap-sass', '~> 2.3.1.2'
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'uglifier'
end

group :development do
  gem 'better_errors'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'fakeweb'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'simplecov'
end
