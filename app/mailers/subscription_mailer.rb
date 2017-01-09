class SubscriptionMailer < ApplicationMailer
  def successful_subscription_notification(user)
    mail to: user.email, subject: "Subscription confirmation"
  end
end
