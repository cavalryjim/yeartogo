class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user, :pending_requests
	
	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	def pending_requests
		@pending_requests ||= Friendship.find_all_by_friend_id_and_status(current_user.id,0) if current_user
	end
end
