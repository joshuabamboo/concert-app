class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    GrabSpotifyArtistsJob.perform_later(@user)
  end
end
