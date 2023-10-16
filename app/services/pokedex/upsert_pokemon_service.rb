module Pokedex
  class UpsertPokemonService < ApplicationService
    attr_accessor :pokemon, :attributes

    def initialize(pokemon, attributes)
      @pokemon = pokemon
      @attributes = attributes
    end

    def call
      ActiveRecord::Base.transaction do
        upsert_pokemon!
      end
      pokemon
    end

    private

    def upsert_pokemon!
      pokemon.assign_attributes(attributes)
      pokemon.save!
    end
  end
end
