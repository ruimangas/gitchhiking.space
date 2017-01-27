require 'date'

# Sends an email to each subscribed user every sunday

desc 'send digest email'
task send_recent_stars_email: :environment do
  if Date.today.sunday?
     User.select(&:subscribed).each do |user|
      repos = StarredRepos.new(user.nickname).starred_repos
      StarsMailer.recent_stars_notification(user, repos).deliver
    end
  end
end
