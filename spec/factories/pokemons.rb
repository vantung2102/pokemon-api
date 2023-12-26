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
FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    pokemon_api_id { Faker::Number.number(digits: 10) }
    height { Faker::Number.number(digits: 2) }
    weight { Faker::Number.number(digits: 2) }
    category { Faker::Games::Pokemon.move }
    stats { { hp: Faker::Number.number(digits: 2) } }
    association :region
  end
end
