class Comment < ActiveRecord::Base
	has_one :user
end
