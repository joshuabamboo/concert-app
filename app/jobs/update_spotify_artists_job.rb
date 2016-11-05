class UpdateSpotifyArtistsJob < ApplicationJob
  queue_as :default

  def perform(user)
    # NAIVE SOLUTION
    # get array of existing user.artists
    # grabspotifyartists
    # if array doesnt include artists, create object and associate to user
    
    # Slightly better
    # Use existing job. Still hits api too much
    GrabSpotifyArtistsJob.perform_now(user) #This also grabs events

    # Even Better solution
    # does api give access to recently updated playlists?
    # if so, check for recent updates
  end
end
