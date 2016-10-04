require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_ID'], ENV['SPOTIFY_SECRET'], scope: 'playlist-read-private user-follow-read user-library-read user-top-read user-read-email'
end