# Preview all emails at http://localhost:3000/rails/mailers/stars_mailer
class StarsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/stars_mailer/recent_stars_notification
  def recent_stars_notification
    StarsMailer.recent_stars_notification
  end

end
