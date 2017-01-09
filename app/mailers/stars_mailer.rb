class StarsMailer < ApplicationMailer
  def recent_stars_notification(user, starred_repos)
    @repos = starred_repos
    mail to: user.email, subject: "Gitchhikers: Your Github starred repos digest"
  end
end

