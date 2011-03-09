class AddRecoveryAndActivationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :recovery, :string
    add_column :users, :activate_token, :string
  end

  def self.down
    remove_column :users, :activate_token
    remove_column :users, :recovery
  end
end
