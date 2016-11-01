class GrabSpotifyArtistsJob < ApplicationJob
  queue_as :default

  def perform(user)
    artists = user.all_spotify_artists(client(user))
    artists.each do |artist_name|
      artist = Artist.find_or_create_by(name: artist_name)
      associate_artists_to(user, artist)
    end
    GrabArtistsEventsJob.perform_later(artists, user) #is there any scenario where we want artists but no events?
  end


  def associate_artists_to(user, artist)
      user.artists << artist if !user.artists.include? artist
    end
  end

  private
  def client(user)
    SpotifyClient.for(user)
  end
end
