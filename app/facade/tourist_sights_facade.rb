class TouristSightsFacade
  def self.tourist_sights(country)
    # require 'pry'; binding.pry
    capital_info = CountryFacade.capital_info(country)
    # require 'pry'; binding.pry
    sights = TouristSightsService.tourist_sights(capital_info.longitude, capital_info.latitude)
      TouristSight.new(sights)
    # end
  end
end