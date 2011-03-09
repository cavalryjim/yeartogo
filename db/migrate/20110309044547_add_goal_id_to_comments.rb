class AddGoalIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :goal_id, :integer
  end

  def self.down
    remove_column :comments, :goal_id
  end
end
