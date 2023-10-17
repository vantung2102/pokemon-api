module API
  module Pokedex
    class TypePolicy < API::BasePolicy
      def self.permitted_attributes
        [
          :name,
          :description,
          double_damage_from: [],
          double_damage_to: [],
          half_damage_from: [],
          half_damage_to: [],
          no_damage_from: [],
          no_damage_to: []
        ]
      end
    end
  end

end
