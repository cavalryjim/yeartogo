class DropSerialAndTypeFromMilestones < ActiveRecord::Migration
  def self.up
		remove_column :milestones, :serial
		remove_column :milestones, :type
  end

  def self.down
    add_column :milestones, :type, :integer
    add_column :milestones, :serial, :integer
  end
end
