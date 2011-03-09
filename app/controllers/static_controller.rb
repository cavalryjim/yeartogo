class StaticController < ApplicationController
  def home
		@completed = Goal.order("updated_at DESC").where("completed = ? AND privacy = ?",true,2)
		@categories = Category.all(:include => :goals).sort_by { |c| -c.goals.size }
  end

  def about
  end

  def terms
  end

  def privacy
  end

end
