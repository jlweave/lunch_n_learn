require 'rails_helper'

RSpec.describe "Tourist Sight Poros" do
  it "exists with attributes" do
    # require 'pry'; binding.pry
    data = {:type=>"FeatureCollection",
            :features=>
              [{:type=>"Feature",
                :properties=>
                {:name=>"Chipmunk Beaut Pageant",
                  :formatted=> " Whoknows Rd Whoville, Co, 12345678", 
                  :place_id=> "1234567890"}}]}
    sight = TouristSight.new(data)
# require 'pry'; binding.pry
    expect(sight).to be_an_instance_of(TouristSight)
    expect(sight.name).to eq("Chipmunk Beaut Pageant")
    expect(sight.address).to eq(" Whoknows Rd Whoville, Co, 12345678")
    expect(sight.place_id).to eq("1234567890")
  end
end