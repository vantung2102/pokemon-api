module API
  module V1
    module Pokedex
      class PokemonsController < BaseController
        include Resourceable

        resource_with class: Pokemon,
                      collection_variable: :@pokemons,
                      object_variable: :@pokemon

        skip_before_action :authenticate_user!, only: %i[index show]
        before_action :prepare_collection, only: %i[index]
        before_action :prepare_new_object, only: %i[create]
        before_action :prepare_object, only: %i[show update destroy]


        def index
          pagy, collection = paginate(filtered_collection)
          render_resource_collection(collection, pagy: pagy, each_serializer: ::Pokedex::PokemonSerializer)
        end

        def show
          render_resource(object, serializer: ::Pokedex::PokemonSerializer)
        end

        def create
        end

        def update; end

        def destroy

        end

        private

        def resource_permitted_params
          params.require(:pokemon).permit(API::Pokedex::PokemonPolicy.pokemon_permitted_attributes)
        end

        def filtered_collection
          ::Pokedex::GatherPokemonService.call(collection, filter_params, order_params)
        end
      end
    end
  end
end
