class Country
  attr_reader :name, :cap_name, :latitude, :longitude
  def initialize(attr)
    @name = attr.first[:name][:official]
    @cap_name = attr.first[:capital][0]
    # require 'pry'; binding.pry
    @latitude = attr.first[:latlng][0]
    @longitude = attr.first[:latlng][1]
  end
end