class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    GrabSpotifyArtistsJob.perform_now(user)
    UserMailer.welcome_email(user).deliver_now
  end
end
