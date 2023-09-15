module API
  module V1
    module Pokemon
      class PokemonsController < BaseController
        include API::Resourceable

        before_action :prepare_collection
        before_action :prepare_object

        def index

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