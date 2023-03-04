class RecipesService
  def self.conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params["app_id"] = ENV["recipe_api_id"]
      faraday.params["app_key"] = ENV["recipe_api_key"]
    end
  end

  def self.find_recipes(country)
    response = conn.get("/api/recipes/v2?type=public&q=#{country}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end