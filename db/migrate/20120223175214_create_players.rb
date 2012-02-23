class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :login
      t.string :password
      t.float :money
      t.timestamps
    end
  end
end
