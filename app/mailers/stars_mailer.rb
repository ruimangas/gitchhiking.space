class StarsMailer < ApplicationMailer
  NUM_REPO = 4

  def recent_stars_notification(user, starred_repos)
    attachments.inline['header_mail.png'] = File.read("#{Rails.root}/app/assets/images/header_mail.png")

    @size = starred_repos.size
    @repos = starred_repos.sort_by { |repo| -repo.fetch(:star_count) }.first(NUM_REPO)

    mail to: user.email, subject: "Gitchhikers: Your Github starred repos digest"
  end
end

