class AddCurrentPowersToWeapons < ActiveRecord::Migration[7.1]
  def change
    add_column :weapons, :currentpower, :integer
  end
end
