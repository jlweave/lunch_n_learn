class ImagesService
  def self.conn
    Faraday.new(url:"https://api.unsplash.com") do |faraday|
      faraday.params[:client_id] = ENV["image_api_key"]
    end
  end

  def self.find_country_images(country)
    response = conn.get("/photos?page=1&per_page=10&order_by=relevant&query=#{country}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end