class UsersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: [:new]

  def new
  end

  def show
    if !current_user.events
      SendWelcomeEmailJob.perform_later(current_user)
    end
    UserMailer.welcome_email(current_user).deliver_now
    @artists = current_user.artists
    current_user.events ? @events = current_user.sort_events : @events = nil #this is ugly
  end

  def update
    current_user.update!(user_params)
    redirect_to current_user, notice: "Your concerts are on the way!" 
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
