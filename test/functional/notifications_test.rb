require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "recovery" do
    mail = Notifications.recovery
    assert_equal "Recovery", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "verification" do
    mail = Notifications.verification
    assert_equal "Verification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
