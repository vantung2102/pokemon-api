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
require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let!(:region) { create(:region) }
  let!(:pokemon) { create(:pokemon, region:) }

  describe 'associations' do
    it { should belong_to(:region) }

    it { should have_many(:pokemon_types).dependent(:destroy) }
    it { should have_many(:pokemon_abilities).dependent(:destroy) }
    it { should have_many(:types).through(:pokemon_types).dependent(:destroy) }
    it { should have_many(:abilities).through(:pokemon_abilities).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:pokemon_api_id) }
    it { should validate_uniqueness_of(:pokemon_api_id).case_insensitive }

    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:stats) }
  end
end
