# == Schema Information
#
# Table name: regions
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Region < ApplicationRecord
  # associations
  has_many :pokemon, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
