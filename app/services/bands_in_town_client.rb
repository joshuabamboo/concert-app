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
      events.collect do |event| 
          {
            title: event["title"],
            date: event["formatted_datetime"],
            ticket_url: event["ticket_url"].gsub(/(&came_from=\d\d\d|&came_from=\d\d|&came_from=\d)/,"")
          }
      end
    rescue => e
      # ignoring artists that do not return a result from bandsintown for now
      []
    end
  end

  def self.asciify(artist)
    artist_non_frozen = artist.dup 
    artist_non_frozen.split("").each_with_index do |letter, index|
      if ascii = ASCII_MAP[letter]
        artist_non_frozen[index] = ascii
      end
    end
    artist_non_frozen
  end
end

