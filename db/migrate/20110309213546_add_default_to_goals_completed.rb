class AddDefaultToGoalsCompleted < ActiveRecord::Migration
  def self.up
		change_column_default :goals, :completed, false
  end

  def self.down
  end
end