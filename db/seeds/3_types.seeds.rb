ActiveRecord::Base.transaction do
  Type.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('types')
  puts '~> Create types'

  [
    "normal", "fighting", "flying", "poison", "ground",
    "rock", "bug", "ghost", "steel", "fire", "water",
    "grass", "electric", "psychic", "ice", "dragon",
    "dark", "fairy", "unknown", "shadow"
  ].each do |name|
    Type.create!(name: name)
  end

  Type.all.each do |type|
    type_api = HTTParty.get("https://pokeapi.co/api/v2/type/#{type.name}")
    damage_relations = type_api['damage_relations']

    %w[double_damage half_damage no_damage].each do |relation|
      from = damage_relations["#{relation}_from"].pluck('name')
      to = damage_relations["#{relation}_to"].pluck('name')

      type.update(
        "#{relation}_from": Type.where(name: from).pluck(:id),
        "#{relation}_to": Type.where(name: to).pluck(:id)
      )
    end
  end

  puts '~> Done create types'
rescue StandardError => e
  puts "~> Faild: #{e}"
end
