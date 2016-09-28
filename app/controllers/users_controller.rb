class UsersController < ApplicationController
  def new
  end

  def show
    user = User.find(params[:id])
    client = SpotifyClient.for(user)
    @top_artists = user.top_artists(client)
  end
end
