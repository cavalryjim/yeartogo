class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.integer :privacy
      t.string :name
      t.datetime :timeline

      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
