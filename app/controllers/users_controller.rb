class UsersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: [:new]

  def new
  end

  def show
    SendWelcomeEmailJob.perform_now(current_user) #move to async action when Devin submits PR
    if !current_user.events
      # SendSubscriptionEmailJob.perform_later(current_user) #change job name
    end
    @artists = current_user.artists
    current_user.events ? @events = current_user.sort_events : @events = nil #this is ugly
  end

  def update
    current_user.update!(user_params)
    redirect_to root_path, notice: "Your concerts are on the way!"
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
