class Api::V1::RecipesController < ApplicationController
  def index
    recipe = RecipesFacade.recipe_by_country(params[:q])
    render json: RecipesSerializer.new(recipe)
  end
end