# == Schema Information
#
# Table name: abilities
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Ability < ApplicationRecord
  # associations
  has_many :pokemon_abilities, dependent: :destroy
  has_many :pokemons, through: :pokemon_abilities, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
