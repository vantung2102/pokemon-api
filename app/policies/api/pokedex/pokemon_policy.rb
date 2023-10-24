module API
  module Pokedex
    class PokemonPolicy < API::BasePolicy
      def self.permitted_attributes
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
          :level_down,
          :level_up,
          {
            stats: [
              :hp,
              :speed,
              :attack,
              :defense,
              'special-attack',
              'special-defense'
            ]
          }
        ]
      end
    end
  end
end
