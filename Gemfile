source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.1.0'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'bcrypt'
gem 'rack-cors'
gem 'blueprinter'
gem 'seedbank'
gem 'pundit'
gem 'rolify'
gem 'pagy'
gem 'jwt'
gem 'enumerize'
gem 'image_processing', '>= 1.2'
gem 'httparty'
gem 'slim'
gem 'devise'
gem 'devise-jwt'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'sentry-ruby'
gem 'sentry-rails'
gem 'rswag'

gem "omniauth"
gem 'omniauth-rails_csrf_protection'

gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-linkedin'
gem "omniauth-facebook"
gem 'omniauth-instagram'
gem "omniauth-google-oauth2"
gem 'omniauth-azure-activedirectory-v2'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'rspec_junit_formatter'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'rubocop', require: false
  gem 'brakeman', require: false
  gem 'letter_opener'
  gem 'annotate'
  gem 'bullet'
end

group :test do
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
  gem 'pundit-matchers'
end
