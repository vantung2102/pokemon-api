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
require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'associations' do
    it { should have_many(:pokemon_types).dependent(:destroy) }
    it { should have_many(:pokemons).through(:pokemon_types).dependent(:destroy) }
    it { should have_many(:double_damage_from).class_name('Type').with_foreign_key('double_damage_from').dependent(:destroy) }
    it { should have_many(:double_damage_to).class_name('Type').with_foreign_key('double_damage_to').dependent(:destroy) }
    it { should have_many(:half_damage_from).class_name('Type').with_foreign_key('half_damage_from').dependent(:destroy) }
    it { should have_many(:half_damage_to).class_name('Type').with_foreign_key('half_damage_to').dependent(:destroy) }
    it { should have_many(:no_damage_from).class_name('Type').with_foreign_key('no_damage_from').dependent(:destroy) }
    it { should have_many(:no_damage_to).class_name('Type').with_foreign_key('no_damage_to').dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of(:description) }
  end
end
