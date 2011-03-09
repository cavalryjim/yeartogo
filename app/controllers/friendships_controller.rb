class FriendshipsController < ApplicationController
  def create
		friend = User.find_by_username(params[:username])
		@friendship = current_user.friendships.build(:friend_id => friend.id)
		if @friendship.save
			redirect_to profile_path(friend.username), :notice => "You've requested friendship with #{friend.username}!"
		else
			redirect_to profile_path(friend.username), :notice => "Error requesting friendship with #{friend.username}, please try again."
		end
  end

  def destroy
		friend = User.find_by_username(params[:username])
	  @friendship = current_user.friendships.find_by_friend_id(friend.id)
	  @friendship.destroy
		@inverse = Friendship.find_by_user_id_and_friend_id(friend.id,current_user.id)
		@inverse.destroy
		redirect_to profile_path(friend.username), :notice => "You're no longer friends with #{friend.username}."
  end

	def pending
		@friendships = Friendship.find_all_by_friend_id_and_status(current_user.id,0)
	end
	
	def approve
		friend = User.find_by_username(params[:username])
		Friendship.find_by_user_id_and_friend_id(current_user,friend.id)
		@friendship = current_user.friendships.build(:friend_id => friend.id)
		@friendship.status = 1
		if @friendship.save
			redirect_to profile_path(friend.username), :notice => "You're now friends with #{friend.username}!"
		else
			redirect_to profile_path(friend.username), :notice => "Error approving friendship with #{friend.username}, please try again."
		end
	end
end
