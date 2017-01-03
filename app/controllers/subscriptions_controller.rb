class SubscriptionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    flash[:success] = "Welcome #{user.name}. You are now subscribed!"
    redirect_to root_path
  end

  def destroy
  end
end
