class VideosService

  def self.conn
    Faraday.new(url: "https://youtube.googleapis.com" ) do |faraday|
      faraday.params["key"] = ENV["google_api_key"]
    end
  end

  def self.find_country_video(country)
    # require 'pry'; binding.pry
    response = conn.get("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&maxResults=1&q=#{country}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end