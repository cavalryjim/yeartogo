class AddGoalIdToMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :goal_id, :integer
  end

  def self.down
    remove_column :milestones, :goal_id
  end
end
