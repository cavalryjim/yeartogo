class StaticController < ApplicationController
  def home
		@completed = Goal.order("updated_at DESC").where("completed = ? AND privacy = ?",true,1).limit(10)
		@categories = Category.all(:include => :goals).sort_by { |c| -c.goals.size }
		motivated_users = @completed.map(&:user).map(&:id).uniq!
		@motivated = Array.new
		motivated_users.each do |u|
			@motivated << User.find(u)
		end
  end

  def about
  end

  def terms
  end

  def privacy
  end

end
