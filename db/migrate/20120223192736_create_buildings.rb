class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.references :planet
      t.references :building_type
      t.integer :level, :default => 0
      t.datetime :upgrading_until
      t.timestamps
    end
  end
end
