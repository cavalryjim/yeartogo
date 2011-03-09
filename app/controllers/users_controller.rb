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
			Notifications.verification(@user.id).deliver
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
		user = User.find_by_activate_token(params[:token])
		if user
			user.activated = true
			user.save
			redirect_to login_path, :notice => "Account activated! Login to begin."
		else
			redirect_to login_path, :notice => "Incorrect activation link. Please check your email and try again."
		end
	end
	
	def recovery
	end
	
	def send_recovery
		user = User.find_by_email(params[:email])
		if user.recovery.blank?
			user.recovery = SecureRandom.hex(20)
			user.save
		end
		Notifications.recovery(user.id).deliver
		redirect_to login_path, :notice => "Password reset instructions sent to your email address."
	end
	
	def reset_form
		if User.find_by_recovery(params[:token]).nil?
			redirect_to login_path, :notice => "Password reset link expired."
		end
	end
	
	def reset_password
		user = User.find_by_recovery(params[:token])
		if params[:password].present? && params[:password_confirmation].present? && params[:password] == params[:password_confirmation]
			user.password = params[:password]
			user.recovery = nil
			if user.save
				redirect_to login_path, :notice => "Your password has been reset."
			end
		else
			flash[:notice] = "An error occured. Please try again."
			render "recovery"			
		end
	end
end
