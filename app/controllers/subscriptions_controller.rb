class SubscriptionsController < ApplicationController
  def index
  end

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
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      User.find(current_user.id).destroy
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end
