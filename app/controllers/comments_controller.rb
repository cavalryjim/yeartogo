class CommentsController < ApplicationController
  def show
  end

  def new
		@comment = Comment.new
  end

  def create
		@comment = Comment.create(params[:comment])
		@comment.goal = Goal.find(params[:comment][:goal_id])
		@comment.user = current_user
		if @comment.save
			redirect_to @comment.goal, :notice => "Comment added!"
		else
			redirect_to @comment.goal, :notice => "Error adding comment."
		end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
