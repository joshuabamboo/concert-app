class GrabArtistsEventsJob < ApplicationJob
  queue_as :default

  def perform(artists, user)
    events = artists.collect {|artist| BandsInTownClient.events_for(artist)}.delete_if { |e| e.empty?  }.flatten
    user.events = events
    user.save
  end
end
