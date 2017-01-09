class ApplicationMailer < ActionMailer::Base
  default from: "stars@#{ENV['DOMAIN']}"
  layout 'mailer'

  def domain
    ENV['DOMAIN']
  end

  def api_key
    ENV['MAILGUN_KEY']
  end
end
