class CreatePokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons, id: :uuid do |t|
      t.string :name
      t.string :type, array: true, default: []
      t.string :weakness, array: true, default: []

      t.timestamps
    end
  end
end
