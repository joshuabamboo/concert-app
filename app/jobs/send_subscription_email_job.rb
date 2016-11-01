class SendSubscriptionEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # update spotify artists
    UpdateSpotifyArtistsJob.perform_later()
    # grab events
    GrabArtistsEventsJob.perform_later(artists, user)
    # send email
    UserMailer.welcome_email(user).deliver_now
  end
end
