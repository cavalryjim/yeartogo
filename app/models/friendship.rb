class Friendship < ActiveRecord::Base
	belongs_to :user
  belongs_to :friend, :class_name => "User"
	
	def self.friends_with?(friend_id)
		friend = find_by_friend_id(friend_id)
		friend.present? && friend.status == 1
	end
	
	def self.requested?(friend_id)
		friend = find_by_friend_id(friend_id)
		friend.present? && friend.status == 0
	end
end