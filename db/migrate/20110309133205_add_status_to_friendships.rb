class AddStatusToFriendships < ActiveRecord::Migration
  def self.up
    add_column :friendships, :status, :integer
  end

  def self.down
    remove_column :friendships, :status
  end
end
