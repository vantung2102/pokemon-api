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
