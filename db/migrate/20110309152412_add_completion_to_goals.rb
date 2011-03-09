class AddCompletionToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :completion, :integer
  end

  def self.down
    remove_column :goals, :completion
  end
end
