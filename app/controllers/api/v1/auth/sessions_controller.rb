module API
  module V1
    module Auth
      class SessionsController < Devise::SessionsController
        include JSONAPIRender
        include ExceptionFilter
        respond_to :json

        private

        def sign_in_params
          params.require(:user).permit(:email, :password)
        end

        def respond_with(resource, _opts = {})
          render_resource(resource)
        end

        def respond_to_on_destroy
          head :no_content
        end

        def verify_signed_out_user
          raise APIError::NotAuthenticatedError unless current_user

          respond_to_on_destroy if all_signed_out?
        end
      end
    end
  end
end
