class CreatePokemonType < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_types, id: :uuid do |t|
      t.references :pokemon, foreign_key: true, type: :uuid , null: false
      t.references :type, foreign_key: true, type: :uuid, null: false

      t.timestamps
    end
  end
end
