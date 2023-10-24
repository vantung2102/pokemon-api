module API
  module V1
    module Auth
      class ProfilesController < BaseController
        before_action :set_user

        def me
          render_resource(current_user)
        end

        def email
          update_user(email_update_params) do
            render json: { message: I18n.t('devise.registrations.updated') }
          end
        end

        def password
          update_user(password_update_params) do
            render json: { message: I18n.t('devise.passwords.updated') }
          end
        end

        def general
          update_user(general_update_params)
        end

        private

        def set_user
          @set_user ||= User.find(current_user.id)
        end

        def update_user(attributes)
          if @user.update_with_password(attributes)
            block_given? ? yield(@user) : render_resource(@user)
          else
            render_resource_errors(@user.errors)
          end
        end

        def email_update_params
          params.require(:user).permit(:email, :current_password)
        end

        def password_update_params
          params.require(:user).permit(:password, :current_password)
        end

        def general_update_params
          params.require(:user).permit(
            :name,
            :gender,
            :dob,
            :nationality_code,
            :phone_code,
            :phone_number,
            :avatar,
            :current_password
          )
        end
      end
    end
  end
end
