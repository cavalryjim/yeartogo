class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :location
      t.string :username
      t.string :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
