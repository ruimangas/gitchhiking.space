class StarsMailer < ApplicationMailer

  def recent_stars_notification(user, starred_repos)
    mg_client = Mailgun::Client.new(api_key)
    mg_client.send_message(domain, mail_params(user, starred_repos)) 
  end

  private 

  def mail_params(user, repos)
    {
      :from => "rui@#{domain}",
      :to => user.email,
      :subject => 'This week stars',
      :text => "This week you starred the following repos: #{repos.join(', ')}"
    }
  end

  def domain
    ENV['DOMAIN']
  end

  def api_key
    ENV['MAILGUN_KEY']
  end
end

