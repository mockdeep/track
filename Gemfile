source 'https://rubygems.org'

ruby '2.1.5'

gem 'dotenv-rails', groups: [:development, :test]

gem 'rails', '~> 3.2.16'

gem 'bcrypt-ruby', '~> 3.0.1', require: 'bcrypt'
gem 'foreigner'
gem 'haml-rails'
gem 'jquery-rails'
gem 'pg'
gem 'strong_parameters'
gem 'unicorn'

group :production do
  gem 'rails_12factor'
end

group :assets do
  gem 'bootstrap-sass', '~> 2.3.1.2'
  gem 'coffee-rails'
  gem 'sass', '~> 3.2.19' # https://github.com/sass/sass/issues/1028
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
