class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(user)
    GrabSpotifyArtistsJob.perform_later(user)
    UserMailer.welcome_email(user).deliver_now
  end
end
