class SubscriptionMailer < ApplicationMailer
  def successful_subscription_notification(user)
    mg_client = Mailgun::Client.new(api_key)
    mg_client.send_message(domain, mail_params(user)) 
  end

  private 

  def mail_params(user)
    {
      :from => "rui@#{domain}",
      :to => user.email,
      :subject => 'Subscription confirmation',
      :text => "Welcome. You are successfully subscribed! You will receive a weekly digest of your github starred repos."
    }
  end

  def domain
    ENV['DOMAIN']
  end

  def api_key
    ENV['MAILGUN_KEY']
  end
end
