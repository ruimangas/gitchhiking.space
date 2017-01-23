require 'date'

desc 'send digest email'
task send_recent_stars_email: :environment do
  if Date.today.sunday?
    User.all.each do |user|
      repos = StarredRepos.new(user.nickname).starred_repos
      StarsMailer.recent_stars_notification(user, repos).deliver
    end
  end
end
