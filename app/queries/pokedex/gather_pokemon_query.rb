module Pokedex
  class GatherPokemonQuery < ApplicationQuery
    query_on Pokemon

    def call

      binding.pry

      relation.extending(Scopes, Orders)
    end
  end
end
