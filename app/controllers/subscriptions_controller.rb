class SubscriptionsController < ApplicationController
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      flash[:success] = "Welcome, #{@user.name}! You are now subscribed."
    rescue
      flash[:warning] = "There was an error while trying to add you to our list..."
    end
    redirect_to root_path
  end

  def destroy
  end
end
