class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.authenticate(params[:username],params[:password])
		if user
			if user.activated?
				session[:user_id] = user.id
				redirect_to root_url, :notice => "Logged in!"
			else
				redirect_to root_url, :notice => "Your account isn't activated. Please follow the instructions in the email."
			end
		else
			flash[:notice] = "Invalid username or password."
			render "new"
		end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
