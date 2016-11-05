class SendSubscriptionEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    # update spotify artists (current solution grabs events too)
    UpdateSpotifyArtistsJob.perform_now(user)
    # grab events
    # GrabArtistsEventsJob.perform_now(artists, user)
    # send email
    UserMailer.welcome_email(user).deliver_now #need to generate another mailer for the subscription email
  end
end
