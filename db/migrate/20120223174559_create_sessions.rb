class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :login
      t.string :password
      t.timestamps
    end
  end
end
