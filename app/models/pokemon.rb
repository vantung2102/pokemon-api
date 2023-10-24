# == Schema Information
#
# Table name: pokemons
#
#  id             :uuid             not null, primary key
#  category       :string
#  gender         :integer          default("female_and_male")
#  height         :string
#  is_gigamax     :boolean          default(FALSE)
#  is_legendary   :boolean          default(FALSE)
#  is_mega        :boolean          default(FALSE)
#  is_mythical    :boolean          default(FALSE)
#  level_down     :string
#  level_up       :string
#  name           :string
#  stats          :jsonb
#  weight         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pokemon_api_id :string
#  region_id      :uuid             not null
#
# Indexes
#
#  index_pokemons_on_region_id  (region_id)
#
# Foreign Keys
#
#  fk_rails_...  (region_id => regions.id) ON DELETE => cascade
#
class Pokemon < ApplicationRecord
  enum gender: { female_and_male: 0, female: 1, male: 2, genderless: 3 }

  # associations
  belongs_to :region

  has_one_attached :image

  has_many :pokemon_types, dependent: :destroy
  has_many :pokemon_abilities, dependent: :destroy
  has_many :types, through: :pokemon_types, dependent: :destroy
  has_many :abilities, through: :pokemon_abilities, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
  validates :pokemon_api_id, presence: true, uniqueness: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :category, presence: true
  validates :stats, presence: true
end
