require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
 Bundler.require(*Rails.groups)

module ConcertApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :sidekiq
    config.serve_static_assets = true
    # config.asset_host = 'http://localhost:3000/' #'https://concert-radar.herokuapp.com/'
    config.action_controller.asset_host = 'https://concert-radar.herokuapp.com/'
    config.action_mailer.asset_host = 'https://concert-radar.herokuapp.com/'
  end
end
 Dotenv::Railtie.load
RSpotify::authenticate(ENV['SPOTIFY_ID'], ENV['SPOTIFY_SECRET'])
