module API
  module V1
    module Auth
      class OmniauthController < BaseController
        include Resourceable

        skip_before_action :authenticate_user!

        def create
          @user = Auth::OmniauthService.call(resource_permitted_params)

          if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
          else
            session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
            redirect_to new_user_registration_url
          end
        end

        def failure; end

        private

        def resource_permitted_params
          @omniauth = params.require(:omniauth)
                            .permit(API::Auth::OmniauthPolicy.omniauth_permitted_attributes)
        end
      end
    end
  end
end
