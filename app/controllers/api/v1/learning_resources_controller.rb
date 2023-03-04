class Api::V1::LearningResourcesController < ApplicationController
  def index
    # require 'pry'; binding.pry
    results = LearningResourcesFacade.country_resources(params[:q])
    # require 'pry'; binding.pry
    render json: LearningResourcesSerializer.new(results)
  end
end

# if country is nil error message: 400
#if country !nil render json