# == Schema Information
#
# Table name: pokemon_abilities
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ability_id :uuid             not null
#  pokemon_id :uuid             not null
#
# Indexes
#
#  index_pokemon_abilities_on_ability_id  (ability_id)
#  index_pokemon_abilities_on_pokemon_id  (pokemon_id)
#
# Foreign Keys
#
#  fk_rails_...  (ability_id => abilities.id)
#  fk_rails_...  (pokemon_id => pokemons.id)
#
class PokemonAbility < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability
end
