class SupportsController < ApplicationController
  def home
    render json: { app: 'pokemon-rails-api', version: '0.0.1' }
  end
end
