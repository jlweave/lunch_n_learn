class CountryFacade
  def self.find_all
    results = CountryService.find_all_countries
    results.map do |result|
      Country.new(result)
    end
  end

  def self.capital_info(country)
    # require 'pry'; binding.pry
    results = CountryService.find_country_cap(country)
    # require 'pry'; binding.pry
    # results[0].map do |result|
      # require 'pry'; binding.pry
      Country.new(results)
    # end
  end

  def self.randomizer
    find_all.sample
  end
end