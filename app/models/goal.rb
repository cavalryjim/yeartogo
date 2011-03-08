class Goal < ActiveRecord::Base
	has_one :category
	has_many :tags
	has_many :comments
	has_many :milestones
end
