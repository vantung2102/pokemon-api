module Pokedex
  class GatherPokemonService < ApplicationService
    attr_reader :collection, :filters, :orders

    def initialize(collection, filters, orders)
      @collection = collection
      @filters = filters
      @orders = orders
    end

    def call
      binding.pry
      Pokedex::GatherPokemonQuery.call(collection, filters, orders)
    end
  end
end
