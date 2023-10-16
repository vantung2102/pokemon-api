module API
  module Pokedex
    class PokemonPolicy < API::BasePolicy
      class << self

        def permitted_attributes
          [
            :pokemon_api_id,
            :name,
            :height,
            :weight,
            :category,
            :gender,
            :is_mega,
            :is_gigamax,
            :is_legendary,
            :is_mythical,
            :region_id,
            :images,
            stats: [
              :hp,
              :speed,
              :attack,
              :defense,
              'special-attack',
              'special-defense'
            ],
            level_down: [],
            level_up: [],
          ]
        end
      end
    end
  end
end
