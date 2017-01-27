class SubscriptionsController < ApplicationController
  def index
  end

  def create
    if current_user
      current_user.update(subscribed: true)
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      current_user.destroy
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end
