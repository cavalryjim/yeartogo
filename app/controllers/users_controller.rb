class UsersController < ApplicationController
  def show
  end

  def new
		@user = User.new
  end

  def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to login_url, :notice => "Signed up! Please check your email for activation instructions."
			#Notifications.verification(@person.id).deliver
		else
			render "new"
		end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def activate
  end

end
