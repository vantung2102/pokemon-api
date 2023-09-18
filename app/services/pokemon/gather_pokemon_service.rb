module Pokemon
  class GatherPokemonService < ApplicationService
    attr_reader :collection, :filters, :orders

    def initialize(collection, filters, orders)
      @collection = collection
      @filters = filters
      @orders = orders
    end

    def call
      Pokemon::GatherPokemonQuery.call()
    end

    private

  end
end
