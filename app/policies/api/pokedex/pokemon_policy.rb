module API
  module Pokedex
    class PokemonPolicy < API::BasePolicy
      def index?
        binding.pry
        true
      end

      class << self
        def pokemon_permitted_attributes
          binding.pry
          [
            :name
          ]
        end
      end
    end
  end
end
