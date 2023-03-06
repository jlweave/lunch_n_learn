class TouristSightsService 
  def self.conn
    Faraday.new("https://api.geoapify.com") do |faraday|
      faraday.params['apiKey'] = ENV['place_api_key']
    end
  end

  def self.tourist_sights(longitude, latitude)
    response = conn.get("/v2/places?categories=tourism.sights&filter=circle:#{longitude},#{latitude},5000")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end