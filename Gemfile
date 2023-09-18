source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8'
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
gem 'rswag'
gem 'httparty'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
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
end
