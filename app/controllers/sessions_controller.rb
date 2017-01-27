class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    if User.exists?(id: user.id)
      flash[:success] = "You are already subscribed."
    else
      user.save!
      SubscriptionMailer.successful_subscription_notification(user).deliver
      flash[:success] = "Welcome #{user.name}. You are now subscribed!"
    end

    session[:user_id] = user.id
    redirect_to subscriptions_index_path
  end

  def destroy
  end

  def index
  end
end
