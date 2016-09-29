class UsersController < ApplicationController
  def new
  end

  def show
    user = User.find(params[:id])
    client = SpotifyClient.for(user)
    @top_artists = user.top_artists(client)
    @events = @top_artists.collect {|artist| BandsInTownClient.events_for(artist)}.delete_if { |e| e.empty?  }
  end
end
