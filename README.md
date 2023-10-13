# Rails Simple Starter

Ruby On Rails API simple starter template :goat: :goat: :goat:.

## General Information

- Ruby version: `ruby 3.1.2`
- Rails version: `rails 7.0.3`
- Database: `postgresql`

## Installation

- Install correct ruby version for our project: `rbenv local 3.1.2`
- Install bundler: `gem install bundler`
- Install gems: `bundle install`
- Config database: create `config/database.yml` file (refer example file at `config/database.yml.example`)
- Add env: create `.env` file (refer example file at `.env.example`)
- Add rails master key at `config/master.key` or generate new one by `rm -rf config/credentials.yml.enc && rm -rf config/master.key && EDITOR=vim rails credentials:edit`
- Database setup: `bundle exec rake db:setup`
- Start server: `rails s`
- Start webpack server: `./bin/webpack-dev-server`
- Visit `http://localhost:3000` and start your development

## Rspec

- Run test by `bundle exec rspec`
- Check test coverage at `coverage/index.html`
