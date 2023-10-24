module Pokedex
  class GatherPokemonQuery < ApplicationQuery
    query_on Pokemon

    def call
      relation.extending(Scopes, Orders)
              .filter_by_name(options[:name])
              .order_by(options[:order_by], options[:order_direction])
    end

    module Scopes
      def filter_by_name(name)
        return self if name.blank?

        where(name:)
      end
    end

    module Orders
      def order_by(column, direction)
        return self if column.blank? && direction.blank?

        order(column => direction)
      end
    end
  end
end
