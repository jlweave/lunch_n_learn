class CountryService
  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.find_all_countries
    response = conn.get("/v3.1/all")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end