class TouristSight
  attr_reader :name, :formatted_address, :place_id

  def initialize(attr)
    # require 'pry'; binding.pry
    @name = attr[:features].first[:properties][:name]
    @formatted_address = attr[:features].first[:properties][:formatted]
    @place_id = attr[:features].first[:properties][:place_id]
  end
end