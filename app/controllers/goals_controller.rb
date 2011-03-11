class GoalsController < ApplicationController
  def new
		@goal = Goal.new
  end

  def create
		@goal = Goal.create(params[:goal])
		@goal.user = current_user
		if @goal.save
			redirect_to milestones_path(@goal), :notice => "Goal successfully created! Now, set some milestones."
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
	
	def milestones
		@goal = Goal.find(params[:id])
		5.times { @goal.milestones.build }
	end
	
	def add_milestones
		@goal = Goal.find(params[:id])
		params[:milestones].each_value do |m|
			@goal.milestones << Milestone.create(m) unless m.each.all?(&:blank?)
		end
	  redirect_to goal_path(@goal), :notice => "Milestones added!"
	end
	
	def complete_milestones
		@milestone = Milestone.find(params[:milestone_id])
		@milestone.completed = true
		@milestone.completed_on = Time.now
		if @milestone.save
			redirect_to goal_path(@milestone.goal), :notice => "Milestone completed. Congratulations!"
		else
			redirect_to goal_path(@milestone.goal), :notice => "Error completing milestone. Please try again."
		end
	end
end
