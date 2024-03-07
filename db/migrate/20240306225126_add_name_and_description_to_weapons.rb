class AddNameAndDescriptionToWeapons < ActiveRecord::Migration[7.1]
  def change
    add_column :weapons, :name, :string
    add_column :weapons, :description, :text
  end
end
