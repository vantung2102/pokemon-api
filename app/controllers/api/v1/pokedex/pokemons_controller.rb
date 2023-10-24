module API
  module V1
    module Pokedex
      class PokemonsController < BaseController
        include Resourceable

        OBJECT_INCLUDES = %i[
          region
        ].freeze

        skip_before_action :authenticate_user!
        before_action :prepare_collection, only: %i[index]
        before_action :prepare_new_object, only: %i[create]
        before_action :prepare_object, only: %i[show update destroy]

        resource_with class: Pokemon,
                      collection_variable: :@pokemons,
                      object_variable: :@pokemon,
                      collection_includes: OBJECT_INCLUDES

        def index
          pagy, collection = paginate(filtered_collection)
          render_resource_collection(collection, pagy:, each_serializer: ::Pokedex::PokemonSerializer)
        end

        def show
          render_resource(@pokemon, serializer: ::Pokedex::PokemonSerializer)
        end

        def create
          pokemon = ::Pokedex::UpsertPokemonService.call(@pokemon, resource_permitted_params)
          render_resource(pokemon, serializer: ::Pokedex::PokemonSerializer, status: :created)
        end

        def update
          pokemon = ::Pokedex::UpsertPokemonService.call(@pokemon, resource_permitted_params)
          render_resource(pokemon, serializer: ::Pokedex::PokemonSerializer, stasus: :ok)
        end

        private

        def resource_permitted_params
          params.require(:pokemon).permit(::API::Pokedex::PokemonPolicy.permitted_attributes)
        end

        def filtered_collection
          ::Pokedex::GatherPokemonService.call(collection, filter_params, order_params)
        end
      end
    end
  end
end
