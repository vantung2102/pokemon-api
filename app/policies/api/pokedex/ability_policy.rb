module API
  module Pokedex
    class AbilityPolicy < API::BasePolicy
      def self.permitted_attributes
        [
          :name,
          :description
        ]
      end
    end
  end
end
