class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :goal
	validates_presence_of :body
end
