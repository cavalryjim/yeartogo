class AddDefaultToStatus < ActiveRecord::Migration
  def self.up
		change_column_default :friendships, :status, false
  end

  def self.down
  end
end