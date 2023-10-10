module API
  module V1
    module Pokedex
      class PokemonsController < BaseController
        include Resourceable

        resource_with class: Pokemon

        before_action :prepare_collection
        before_action :prepare_object


        def index
          pagy, collection = paginate(filtered_collection)
          render_resource_collection(collection, pagy:)
        end

        def show; end

        def update; end

        def destroy

        end

        private

        def resource_permitted_params
          params.require(:pokemon).permit(API::PokemonPolicy.pokemon_permitted_attributes)
        end

        def filtered_collection
          ::Pokemon::GatherPokemonService.call(collection, filter_params, order_params)
        end
      end
    end
  end
end
