class Api::V1::TouristSightsController < ApplicationController
  def index
    # require 'pry'; binding.pry
    tourist_sights = TouristSightsFacade.tourist_sights(params[:country])
    render json: TouristSightsSerializer.new(tourist_sights)
  end
end