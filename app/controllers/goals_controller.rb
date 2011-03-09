class GoalsController < ApplicationController
  def new
		@goal = Goal.new
  end

  def create
		@goal = Goal.create(params[:goal])
		case params[:goal][:privacy]
		when "Public"
			@goal.privacy = 1
		when "Friends"
			@goal.privacy = 2
		when "Private"
			@goal.privacy = 3
		end
		@goal.timeline = Time.now.advance(:days => params[:goal][:days], 
																			:months => params[:goal][:month],
																			:years => params[:goal][:years])
		@goal.user = current_user
		if @goal.save
			redirect_to @goal, :notice => "Goal successfully created! Get on it."
		else
			flash[:notice] = "Error creating goal. Please try again."
			render "new"
		end
  end

  def edit
  end

  def update
  end

  def destroy
  end

	def show
		@goal = Goal.find(params[:id])
		if @goal.private? && @goal.user != current_user
			redirect_to profile_path, :notice => "You don't have permission to view that goal."
		elsif @goal.friends? && !current_user.friendships.friends_with?(@goal.user)
			redirect_to profile_path, :notice => "You don't have permission to view that goal."
		end
		@comment = Comment.new
	end
end
