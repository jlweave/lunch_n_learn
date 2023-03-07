class Api::V1::LearningResourcesController < ApplicationController
  def index
    results = LearningResourcesFacade.country_resources(params[:q])
    render json: LearningResourcesSerializer.new(results)
  end
end

# if country is nil error message: 400
#if country !nil render json