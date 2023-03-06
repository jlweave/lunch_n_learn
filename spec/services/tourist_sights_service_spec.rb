require 'rails_helper'

RSpec.describe TouristSightsFacade do 
  before (:each) do
    json_response = File.read('spec/fixtures/country_results.json')
    json_response2 = File.read('spec/fixtures/places_results.json')

    query = "Gambia"

    api_key = ENV['place_api_key']

    stub_request(:get, "https://api.geoapify.com/v2/places?apiKey=#{api_key}&categories=tourism.sights&filter=circle:-16.56666666,13.46666666,5000")
      .to_return(status: 200, body: json_response2, headers: {})

       stub_request(:get, "https://restcountries.com/v3.1/all")
       .to_return(status: 200, body: json_response, headers: {})
  end
  it "returns a list of tourist sights for a given location" do
    sights = TouristSightsService.tourist_sights(-16.56666666,13.46666666)

    expect(sights).to be_an (Hash)

    expect(sights[:features].first[:properties]).to have_key(:name)
    expect(sights[:features].first[:properties]).to have_key(:formatted)
    expect(sights[:features].first[:properties]).to have_key(:place_id)
    expect(sights[:features].first[:properties][:name]).to eq( "Arch 22")
    expect(sights[:features].first[:properties][:formatted]).to eq("Arch 22, Independence Drive, Banjul City Council, The Gambia")
    expect(sights[:features].first[:properties][:place_id]).to eq("51f95a2a0e1e9530c059fb6cca91b0eb2a40f00102f9011e0a3d0f0000000092030741726368203232")
  end
end