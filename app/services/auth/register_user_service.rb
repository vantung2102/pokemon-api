module Auth
  class RegisterUserService < ApplicationService
    attr_reader :params, :role

    def initialize(params)
      @params = params.except(:role)
      @role = params[:role]
    end

    def call
      User.create!(params)
    end
  end
end
