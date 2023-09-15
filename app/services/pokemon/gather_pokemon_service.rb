module Pokemon
  class GatherPokemonService < ApplicationService
    def initialize(collection, filters, orders)
      @collection = collection
      @filters = filters
      @orders = orders
    end

    def call
      Pokemon::GatherPokemonQuery.call()
    end

    private

    attr_accessor :collection, :filters, :orders
  end
end