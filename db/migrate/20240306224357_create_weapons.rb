class CreateWeapons < ActiveRecord::Migration[7.1]
  def change
    create_table :weapons do |t|
      t.integer :power_base
      t.integer :power_step
      t.integer :level

      t.timestamps
    end
  end
end
