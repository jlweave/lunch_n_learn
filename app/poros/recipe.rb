class Recipe
  attr_reader :country

  def initialize(result, country)
    require 'pry'; binding.pry
    @country = country
  end
end