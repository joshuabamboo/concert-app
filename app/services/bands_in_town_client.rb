require 'rest-client'
require 'json'

class BandsInTownClient
  ASCII_MAP = {
    "Ø" => "O",
    "é" => "e"
  }

  def self.events_for(artist)
    artist = asciify(artist) if !artist.ascii_only?
    formatted_artist = artist.gsub(" ", "%20")
    url = "http://api.bandsintown.com/artists/#{formatted_artist}/events/search.json?api_version=2.0&app_id=spotify_concerts&location=New+York,NY&radius=10"
    begin
      response = RestClient.get(url)
      events = JSON.parse(response)
      events.collect {|event| event["title"]}
    rescue => e
      []
    end
  end

  def self.asciify(artist)
    artist.split("").each_with_index do |letter, index|
      if ascii = ASCII_MAP[letter]
        artist[index] = ascii
      end
    end
    artist
  end
end

