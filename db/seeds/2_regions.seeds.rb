ActiveRecord::Base.transaction do
  Region.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('regions')
  puts '~> Create regions'

  [
    "kanto", "johto", "hoenn", "sinnoh", "unova",
    "kalos", "alola", "galar", "hisui", "paldea"
  ].each do |name|
    Region.create!(name: name)
  end

  puts '~> Done create regions'
rescue StandardError => e
  puts "~> Faild: #{e}"
end
