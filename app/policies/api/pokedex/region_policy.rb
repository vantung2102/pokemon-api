module API
  module Pokedex
    class RegionPolicy < API::BasePolicy
      def self.permitted_attributes
        [
          :name,
          :description
        ]
      end
    end
  end
end
