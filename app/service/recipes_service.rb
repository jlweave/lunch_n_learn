class RecipesService
  def self.conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      # require 'pry'; binding.pry
      faraday.params["app_id"] = ENV["recipe_api_id"]
      faraday.params["app_key"] = ENV["recipe_api_key"]
      # require 'pry'; binding.pry
    end
  end

  def self.find_recipes(country)
    response = conn.get("/api/recipes/v2?type=public&q=#{country}")
    # require 'pry'; binding.pry
    data = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end