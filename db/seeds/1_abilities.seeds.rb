ActiveRecord::Base.transaction do
  Ability.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('abilities')
  puts '~> Create abilities'

  abilities = HTTParty.get('https://pokeapi.co/api/v2/ability?limit=10000')
  abilities['results'].each do |ability|
    Ability.create!(name: ability['name'])
  end

  puts '~> Done create abilities'
rescue StandardError => e
  puts "~> Faild: #{e}"
end
