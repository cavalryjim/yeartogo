class Milestone < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :timeline
	
	belongs_to :goal
end
