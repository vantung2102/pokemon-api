module API
  module V1
    module Auth
      class OmniauthController < BaseController
        include API::Resourceable

        skip_before_action :authenticate_user!

        def create
          case @omniauth[:provider]
          when

          when

          else

          end
        end

        def failure; end

        private

        def resource_permitted_params
          @omniauth = params.require(:omniauth).permit(API::PokemonPolicy.pokemon_permitted_attributes)
        end

        def omniauth_params
          @omniauth = params.require(:omniauth).permit(
            :uid,
            :provider,
            :request
          )
        end

        def generic_callback(provider)
          @user = User.from_omniauth(request.env['omniauth.auth'])

          if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
          else
            session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
            redirect_to new_user_registration_url
          end
        end
      end
    end
  end
end