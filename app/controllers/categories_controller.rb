class CategoriesController < ApplicationController
  def show
		@category = Category.find_by_name(params[:name])
		@goals = @category.goals.where("privacy = ?",1)
  end

end
