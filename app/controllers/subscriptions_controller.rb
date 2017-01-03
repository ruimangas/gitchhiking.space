class SubscriptionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    found_repos = StarredRepos.new(user.nickname, 1.week.ago).starred_repos
    StarsMailer.recent_stars_notification(user, found_repos).deliver
    render text: found_repos
  end

  def destroy
  end
end
