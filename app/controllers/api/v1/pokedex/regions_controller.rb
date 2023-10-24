module API
  module V1
    module Pokedex
      class RegionsController < BaseController
        include Resourceable

        skip_before_action :authenticate_user!

        resource_with class: Region,
                      collection_serializer: ::Pokedex::RegionSerializer,
                      object_serializer: ::Pokedex::RegionSerializer

        private

        def resource_permitted_params
          params.require(:region).permit(::API::Pokedex::RegionPolicy.permitted_attributes)
        end
      end
    end
  end
end
