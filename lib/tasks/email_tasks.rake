require 'date'

desc 'send digest email'
task send_recent_stars_email: :environment do
  if Date.today.monday?
    User.all.each do |user|
      found_repos = StarredRepos.new(user.nickname, 1.week.ago).starred_repos
      StarsMailer.recent_stars_notification(user, found_repos).deliver
    end
  end
end
