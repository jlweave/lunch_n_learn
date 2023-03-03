class Api::V1::RecipesController < ApplicationController
  def index
    # require 'pry'; binding.pry
    if params[:q] != nil
      recipe = RecipesFacade.recipe_by_country(params[:q])
      render json: RecipesSerializer.new(recipe)
    else
      country = CountryFacade.randomizer
      recipes = RecipesFacade.recipe_by_country(country.name)
      render json: RecipesSerializer.new(recipes)
    end
  end
end