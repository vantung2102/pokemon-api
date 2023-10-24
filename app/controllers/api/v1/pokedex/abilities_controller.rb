module API
  module V1
    module Pokedex
      class AbilitiesController < BaseController
        include Resourceable

        skip_before_action :authenticate_user!

        resource_with class: Ability,
                      collection_serializer: ::Pokedex::AbilitySerializer,
                      object_serializer: ::Pokedex::AbilitySerializer

        private

        def resource_permitted_params
          params.require(:ability).permit(::API::Pokedex::AbilityPolicy.permitted_attributes)
        end
      end
    end
  end
end
