# == Schema Information
#
# Table name: pokemons
#
#  id         :uuid             not null, primary key
#  name       :string
#  type       :string           default([]), is an Array
#  weakness   :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord

end
