class SupportsController < ApplicationController
  def home
    render json: {
      ruby: '3.2.2',
      rails: '7.1.0',
      version: '0.0.1',
      app: 'pokemon-rails-api',
    }
  end
end
