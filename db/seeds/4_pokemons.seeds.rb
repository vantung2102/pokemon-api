ActiveRecord::Base.transaction do
  Pokemon.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('pokemons')
  ActiveRecord::Base.connection.reset_pk_sequence!('pokemon_types')
  ActiveRecord::Base.connection.reset_pk_sequence!('pokemon_abilities')

  puts '~> Create pokemons'

  pokemons = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=100000')
  pokemons['results'].each do |pokemon|
    poke = HTTParty.get(pokemon['url'])
    species = HTTParty.get(poke['species']['url'])
    regions = species['pokedex_numbers'].map{ |x| x['pokedex']['name'] }
    form = HTTParty.get("https://pokeapi.co/api/v2/pokemon-form/#{poke['id']}")

    pokemon = Pokemon.create!(
      gender: 0,
      pokemon_api_id: poke['id'],
      name: poke['name'],
      height: poke['height'],
      weight: poke['weight'],
      is_mega: form['is_mega'],
      is_mythical: species['is_mythical'],
      is_legendary: species['is_legendary'],
      is_gigamax: poke['name'].include?('gmax'),
      region_id: Region.find_by(name: regions)&.id || Region.first.id,
      stats: poke['stats'].map { |stat| [stat['stat']['name'], stat['base_stat']] }.to_h,
      category: species['genera'].find{ |genera| genera['language']['name'] == 'en'}['genus']
    )

    poke['types'].each do |type|
      pokemon.pokemon_types.create!(
        type_id: Type.find_by(name: type['type']['name']).id
      )
    end

    poke['abilities'].each do |ability|
      pokemon.pokemon_abilities.create!(
        ability_id: Ability.find_by(name: ability['ability']['name']).id
      )
    end
  end

  puts '~> Done create pokemons'
rescue StandardError => e
  puts "~> Faild: #{e}"
end
