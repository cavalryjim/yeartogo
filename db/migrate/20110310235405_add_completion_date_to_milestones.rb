class AddCompletionDateToMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :completed_on, :datetime
  end

  def self.down
    remove_column :milestones, :completed_on
  end
end
