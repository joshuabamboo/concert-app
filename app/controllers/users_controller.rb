class UsersController < ApplicationController
  def new
  end

  def show
    user = User.find(params[:id])
    client = SpotifyClient.for(user)
    @top_artists = user.top_artists(client).uniq
    @saved_artists = user.saved_artists(client).uniq
    @album_artists = user.saved_albums_artists(client).uniq
    @track_artists = user.saved_tracks_artists(client).uniq
    @playlist_artists = user.playlists(client).uniq
    all_artists = [@top_artists, @saved_artists, @album_artists, @track_artists, @playlist_artists].flatten.uniq
    @events = all_artists.collect {|artist| BandsInTownClient.events_for(artist)}.delete_if { |e| e.empty?  }
  end
end
