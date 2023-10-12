module Pokedex
  class PokemonPolicy < ApplicationPolicy

    def index?
      false
    end

    # class << self
    #   def pokemon_permitted_attributes
    #     binding.pry
    #     [
    #       :name
    #     ]
    #   end
    # end
  end
end
