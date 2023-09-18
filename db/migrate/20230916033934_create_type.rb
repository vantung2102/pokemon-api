class CreateType < ActiveRecord::Migration[7.0]
  def change
    create_table :types, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :double_damage_from, array: true, default: []
      t.string :double_damage_to, array: true, default: []
      t.string :half_damage_from, array: true, default: []
      t.string :half_damage_to, array: true, default: []
      t.string :no_damage_from, array: true, default: []
      t.string :no_damage_to, array: true, default: []

      t.timestamps
    end
  end
end
