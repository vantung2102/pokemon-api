class AddOmniauthToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :omniauth_expires_at, :datetime
  end
end
