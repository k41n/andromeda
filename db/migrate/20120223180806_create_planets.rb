class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.float :x, :y
      t.references :player


      t.float :metal
      t.float :silicon
      t.float :plutonium
      t.float :population

      t.float :metal_income
      t.float :silicon_income
      t.float :plutonium_income
      t.float :population_income

      t.timestamps
    end
  end
end
