# == Schema Information
#
# Table name: types
#
#  id                 :uuid             not null, primary key
#  description        :text
#  double_damage_from :string           default([]), is an Array
#  double_damage_to   :string           default([]), is an Array
#  half_damage_from   :string           default([]), is an Array
#  half_damage_to     :string           default([]), is an Array
#  name               :string
#  no_damage_from     :string           default([]), is an Array
#  no_damage_to       :string           default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Type < ApplicationRecord
  # associations
  has_many :pokemon_types, dependent: :destroy
  has_many :pokemons, through: :pokemon_types, dependent: :destroy
  has_many :double_damage_from, class_name: 'Type', foreign_key: 'double_damage_from', dependent: :destroy
  has_many :double_damage_to, class_name: 'Type', foreign_key: 'double_damage_to', dependent: :destroy
  has_many :half_damage_from, class_name: 'Type', foreign_key: 'half_damage_from', dependent: :destroy
  has_many :half_damage_to, class_name: 'Type', foreign_key: 'half_damage_to', dependent: :destroy
  has_many :no_damage_from, class_name: 'Type', foreign_key: 'no_damage_from', dependent: :destroy
  has_many :no_damage_to, class_name: 'Type', foreign_key: 'no_damage_to', dependent: :destroy

  # validations
end
