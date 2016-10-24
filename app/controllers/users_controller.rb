class UsersController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: [:new]

  def new
  end

  def show
    @user = current_user
    GrabSpotifyArtistsJob.perform_later(@user)
  end
end
