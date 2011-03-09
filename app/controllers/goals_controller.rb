class GoalsController < ApplicationController
  def new
		@goal = Goal.new
  end

  def create
		@goal = Goal.create(params[:goal])
		@goal.timeline = Time.now.advance(:days => params[:goal][:day].to_i, 
																			:months => params[:goal][:month].to_i,
																			:years => params[:goal][:year].to_i)
		@goal.user = current_user
		if @goal.save
			redirect_to @goal, :notice => "Goal successfully created! Get on it."
		else
			flash[:notice] = "Error creating goal. Please try again."
			render "new"
		end
  end

	def complete
		@goal = Goal.find(params[:id])
		@goal.completed = true
		if @goal.save
			redirect_to current_profile_path, :notice => "Goal marked complete. Congratulations!"
		else
			redirect_to @goal, :notice => "Error marking goal complete. Please try again."
		end
	end

  def edit
		@goal = Goal.find(params[:id])
  end

  def update
		@goal = Goal.find(params[:id])
		@goal.timeline = Time.now.advance(:days => params[:goal][:days].to_i, 
																			:months => params[:goal][:month].to_i,
																			:years => params[:goal][:years].to_i)
		@goal.user = current_user
		if @goal.update_attributes
			redirect_to @goal, :notice => "Goal successfully updated! Get back to it."
		else
			flash[:notice] = "Error updating goal. Please try again."
			render "edit"
		end
  end

  def destroy
		@goal = Goal.find(params[:id])
		if @goal.destroy
			redirect_to current_profile_path, :notice => "Goal successfully deleted."
		else
			redirect_to @goal, :notice => "Error deleting goal. Please try again."
		end
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
