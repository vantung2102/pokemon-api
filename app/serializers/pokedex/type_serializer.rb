module Pokedex
  class TypeSerializer < ApplicationSerializer
    fields :name,
           :description

    %i[double_damage_from_type double_damage_to_type half_damage_from_type half_damage_to_type no_damage_from_type no_damage_to].each do |damage_type|
      field damage_type do |object|

        binding.pry

        Type.where(id: object.public_send(damage_type)).pluck(:name)
      end
    end

  end
end
