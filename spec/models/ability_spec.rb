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
require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'associations' do
    it { should have_many(:pokemon_abilities).dependent(:destroy) }
    it { should have_many(:pokemons).through(:pokemon_abilities).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of(:description) }
  end
end
