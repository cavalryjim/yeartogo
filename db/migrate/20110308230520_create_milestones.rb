class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.string :name
      t.integer :type
      t.integer :serial

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
