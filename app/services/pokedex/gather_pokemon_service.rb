module Pokedex
  class GatherPokemonService < ApplicationService
    attr_reader :collection, :filters, :orders

    def initialize(collection, filters, orders)
      @collection = collection
      @filters = filters
      @orders = orders
    end

    def call
      Pokedex::GatherPokemonQuery.call(collection, default_filters.merge(default_orders))
    end

    private

    def default_filters
      filters
    end

    def default_orders
      @normalized_orders ||= {
        order_by: orders[:order_by] || 'id',
        order_direction: orders[:order_direction] || 'desc'
      }
    end
  end
end
