module API
  module Auth
    class OmniauthPolicy < ApplicationPolicy
      def omniauth_permitted_attributes
        [
          :uid,
          :provider,
          :request
        ]
    end
  end
end
