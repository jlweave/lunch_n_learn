class RecipesFacade
  def self.recipe_by_country(country)
    results = RecipesService.find_recipes(country)
    # require 'pry'; binding.pry
    results[:hits].map do |result|
      Recipe.new(result, country)
    end
  end
end