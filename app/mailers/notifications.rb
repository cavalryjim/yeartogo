class Notifications < ActionMailer::Base
  default :from => "Fulfilld.com <notifications@fulfilld.com>"

  def recovery(user_id)
    @user = User.find(user_id)
		@greeting = @user.name || @user.username
    mail :to => @user.email, :subject => "[fulfilld.com] Password reset instructions" 
  end

  def verification(user_id)
    @user = User.find(user_id)
		@greeting = @user.name || @user.username
    mail :to => @user.email, :subject => "[fulfilld.com] Account activation instructions" 
  end
end
