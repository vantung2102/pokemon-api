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
FactoryBot.define do
  factory :region do
    name { Faker::Games::Pokemon.location }
    description { Faker::Lorem.paragraph }
  end
end
