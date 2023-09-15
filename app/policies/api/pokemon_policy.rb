class PokemonPolicy < API::BasePolicy
  def pokemon_permitted_attributes
    [
      :name,
      {
        type: [],
        weakness: []
      }
    ]
  end


end