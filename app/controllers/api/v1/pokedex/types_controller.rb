module API
  module V1
    module Pokedex
      class TypesController < BaseController
        include Resourceable

        OBJECT_INCLUDES = %i[
          double_damage_from
          double_damage_to
          half_damage_from
          half_damage_to
          no_damage_from
          no_damage_to
        ].freeze

        skip_before_action :authenticate_user!
        before_action :prepare_collection, only: %i[index]

        resource_with class: Type,
                      collection_serializer: ::Pokedex::TypeSerializer,
                      object_serializer: ::Pokedex::TypeSerializer,
                      collection_includes: OBJECT_INCLUDES

        private

        def resource_permitted_params
          params.require(:type).permit(::API::Pokedex::TypePolicy.permitted_attributes)
        end
      end
    end
  end
end
