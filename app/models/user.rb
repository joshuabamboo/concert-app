class User < ApplicationRecord
  has_many :user_artists, dependent: :destroy
  has_many :artists, through: :user_artists
  serialize :events

  def self.create_from_oauth(auth_hash)
    self.create(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:info][:display_name],
      email: auth_hash[:info][:email],
      # image_url: auth_hash[:info][:images][0][:url],
      rspotify_hash: auth_hash.to_hash
    )
  end

  def self.from_oauth(auth_hash)
    user = self.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])
    user || create_from_oauth(auth_hash)
  end

  def top_artists(client)
    artists = client.top_artists(time_range: 'long_term', limit: 50).collect {|artist| artist.name}
    artists << client.top_artists(time_range: 'medium_term', limit: 50).collect {|artist| artist.name}
    artists << client.top_artists(time_range: 'short_term', limit: 50).collect {|artist| artist.name}
    artists.flatten.uniq
  end

  def saved_artists(client)
    begin
      artists = client.following(type: 'artist', limit: 50)
      artists.collect {|artist| artist.name}
    rescue => e
      []
    end
  end

  def saved_albums_artists(client)
    albums = client.saved_albums
    albums.collect do |album|
      album.artists.collect {|artist| artist.name}
    end.flatten
  end

  def saved_tracks_artists(client)
    tracks = client.saved_tracks(limit: 50)
    tracks.collect do |track|
      track.artists.collect {|artist| artist.name}
    end.flatten
  end

  def playlists(client)
    playlists = client.playlists(limit: 50)
    playlists.collect do |playlist|
      playlist.tracks.collect do |track|
        track.artists.collect do |artist|
          artist.name
        end
      end
    end.flatten
  end


  def all_spotify_artists(client)
    top_artists = self.top_artists(client).uniq
    saved_artists = self.saved_artists(client).uniq
    album_artists = self.saved_albums_artists(client).uniq
    track_artists = self.saved_tracks_artists(client).uniq
    # playlist_artists = self.playlists(client).uniq
    all_artists = [top_artists, saved_artists, album_artists, track_artists].flatten.uniq
  end


  def sort_events
    self.events.sort_by! do |event|
      event[:date].to_date
    end
  end
  def upcoming_events
    next_week = 7.days.from_now

    sort_events.collect do |event|
      event if event[:date] <= next_week
    end.delete_if {|e| e == nil}

  end

  def remaining_events
    next_week = 7.days.from_now

    sort_events.collect do |event|
      event if event[:date] > next_week
    end.delete_if {|e| e == nil}
  end

  def on_sale_soon_events
    remaining_events
  end
end
