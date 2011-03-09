class Comment < ActiveRecord::Base
	has_one :user
	validates_presence_of :body
end
