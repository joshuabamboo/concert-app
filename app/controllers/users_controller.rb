class UsersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: [:new]

  def new
  end

  def show
    if current_user.artists.empty?
      SendWelcomeEmailJob.perform_later(user)
    end
    @artists = current_user.artists
    @events = current_user.sort_events
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
