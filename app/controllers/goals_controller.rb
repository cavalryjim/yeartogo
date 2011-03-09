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

end
