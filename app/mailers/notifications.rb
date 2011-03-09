class Notifications < ActionMailer::Base
  default :from => "notifications@yeartogo.com"

  def recovery(user_id)
    @user = User.find(user_id)
		@greeting = @user.name || @user.username
    mail :to => @user.email, :subject => "[year to go] Password reset instructions" 
  end

  def verification(user_id)
    @user = User.find(user_id)
		@greeting = @user.name || @user.username
    mail :to => @user.email, :subject => "[year to go] Account activation instructions" 
  end
end
