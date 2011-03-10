class AddTimelineToMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :timeline, :datetime
  end

  def self.down
    remove_column :milestones, :timeline
  end
end
