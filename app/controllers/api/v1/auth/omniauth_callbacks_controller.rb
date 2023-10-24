module API
  module V1
    module Auth
      class OmniauthCallbacksController < Devise::OmniauthCallbacksController
        include JSONAPIRender
        respond_to :json

        def azure_activedirectory_v2
          generic_callback('azure_activedirectory_v2')
        end

        def failure
          set_flash_message(:alert, :failure, kind: omniauth_kind(failed_strategy.name), reason: failure_message)
          redirect_to root_path
        end

        private

        def generic_callback(provider)
          @user = User.from_omniauth(request.env['omniauth.auth'])

          if @user.present?
            set_flash_message(:notice, :success, kind: omniauth_kind(provider))
            sign_in_and_redirect @user, even: :authentication
          else
            set_flash_message(:alert, :failure, kind: omniauth_kind(provider), reason: 'your account has not been created')
            redirect_to root_path
          end
        end

        def omniauth_kind(provider)
          case provider
          when 'azure_activedirectory_v2'
            'Microsoft'
          end
        end

        def resource_permitted_params
          @omniauth = params.require(:omniauth)
                            .permit(API::Auth::OmniauthPolicy.omniauth_permitted_attributes)
        end
      end
    end
  end
end
