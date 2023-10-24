class CreatePokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons, id: :uuid do |t|
      t.string :name
      t.string :height
      t.string :weight
      t.string :category
      t.string :level_up
      t.string :level_down
      t.string :pokemon_api_id
      t.integer :gender, default: 0
      t.boolean :is_mega, default: false
      t.boolean :is_gigamax, default: false
      t.boolean :is_legendary, default: false
      t.boolean :is_mythical, default: false
      t.jsonb :stats, default: {}
      t.references :region, foreign_key: { on_delete: :cascade }, type: :uuid, null: false

      t.timestamps
    end
  end
end
