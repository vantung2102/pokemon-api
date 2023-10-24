ActiveRecord::Base.transaction do
  puts '~> Create evolution chains'

  evolution_chains = HTTParty.get('https://pokeapi.co/api/v2/evolution-chain?limit=10000')
  evolution_chains['results'].each do |evolution_chain|
    evolution = HTTParty.get(evolution_chain['url'])
    evolution_chain = evolution['chain']
    next if evolution_chain['evolves_to'].blank?

    pokemon_level_one = Pokemon.find_by(name: evolution_chain['species']['name'])
    pokemons_level_two = Pokemon.where(name: evolution_chain['evolves_to'].map{ |evolve_two| evolve_two['species']['name'] })

    pokemon_level_one.update(level_up: pokemons_level_two.pluck(:id))
    pokemons_level_two.update(level_down: pokemon_level_one.id)

    next if evolution_chain['evolves_to'][0]['evolves_to'].blank?

    pokemon_level_three = Pokemon.find_by(name: evolution_chain['evolves_to'][0]['evolves_to'][0]['species']['name'])
    pokemons_level_two.update(level_up: pokemon_level_three.id)
    pokemon_level_three.update(level_down: pokemons_level_two.pluck(:id))
  end

  puts '~> Done create evolution chains'

rescue StandardError => e
  puts "~> Faild: #{e}"
end
