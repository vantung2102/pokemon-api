module Auth
  class OmniauthService < ApplicationService
    attr_reader :uid, :provider, :request

    def initialize(params)
      @uid = params[:uid]
      @provider = params[:provider]
      @auth = params[:request].env['omniauth.auth']
    end

    def call
      insert_omniauth
    end

    private

    def insert_omniauth
      user = User.find_by(email: auth.info.email)
      return user if user

      where(provider:, uid:).first_or_create! do |user| # rubocop:todo Lint/ShadowingOuterLocalVariable
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end
end
