module API
  module V1
    module Auth
      class RegistrationsController < Devise::RegistrationsController
        include JSONAPIRender
        respond_to :json

        private

        def sign_up_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end

        def respond_with(resource, _opts = {})
          reture render_resource_errors(resource.errors) if resource.errors.any?

          case action_name
          when 'create', 'update'
            render_resource(resource, resource.previous_changes[:id].present? ? :created : :ok)
          when 'destroy'
            head :no_content
          end
        end
      end
    end
  end
end
