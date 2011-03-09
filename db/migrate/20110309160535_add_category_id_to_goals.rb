class AddCategoryIdToGoals < ActiveRecord::Migration
  def self.up
    add_column :goals, :category_id, :integer
  end

  def self.down
    remove_column :goals, :category_id
  end
end
