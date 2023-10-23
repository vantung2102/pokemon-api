module Pokedex
  class TypeSerializer < ApplicationSerializer
    fields :name, :description

    %i[
      double_damage_from
      double_damage_to
      half_damage_from
      half_damage_to
      no_damage_from
      no_damage_to
    ].each do |damage_type|
      field damage_type do |type|
        type.public_send(damage_type).pluck(:name)
      end
    end
  end
end
