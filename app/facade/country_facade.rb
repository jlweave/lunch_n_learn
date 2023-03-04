class CountryFacade
  def self.find_all
    results = CountryService.find_all_countries
    results.map do |result|
      Country.new(result)
    end
  end

  def self.randomizer
    find_all.sample
  end
end