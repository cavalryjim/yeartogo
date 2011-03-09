class Goal < ActiveRecord::Base
	has_one :category
	has_many :tags
	has_many :comments
	has_many :milestones
	belongs_to :user
	
	validates_presence_of :privacy
	validates_presence_of :name
	validates_uniqueness_of :name, :scope => :user_id 
	validates_presence_of :timeline
	
	def self.private
		(privacy == 1)
	end
	
	def self.public
		(privacy == 2)
	end
	
	def self.friends
		(privacy == 3)
	end
end