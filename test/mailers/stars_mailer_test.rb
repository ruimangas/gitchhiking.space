require 'test_helper'

class StarsMailerTest < ActionMailer::TestCase
  test "recent_stars_notification" do
    mail = StarsMailer.recent_stars_notification
    assert_equal "Recent stars notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
