class TouristSight
  attr_reader :name, :address, :place_id

  def initialize(attr)
    # require 'pry'; binding.pry
    @name = attr[:features].first[:properties][:name]
    @address = attr[:features].first[:properties][:formatted]
    @place_id = attr[:features].first[:properties][:place_id]
  end
end