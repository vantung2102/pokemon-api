module Pokedex
  class PokemonSerializer < ApplicationSerializer
    fields  :name,
            :height,
            :weight,
            :category,
            :level_up,
            :level_down,
            :pokemon_api_id,
            :gender,
            :is_mega,
            :is_gigamax,
            :is_legendary,
            :is_mythical,
            :stats

    field :region do |object|
      object.region.name
    end
  end
end
