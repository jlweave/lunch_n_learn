require 'rails_helper'

RSpec.describe "Tourist Sight Info" do
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
  it "returns tourist sights in a JSON formate" do
    country = "Gambia"
    
    get "/api/v1/tourist_sights?country=#{country}"

    sights = JSON.parse(response.body, symbolize_names: true)
# require 'pry'; binding.pry
    expect(response.status).to eq(200)
  
    expect(sights[:data].count).to eq(3)
    expect(sights).to be_a(Hash)
    sights.each do |sight|
# require 'pry'; binding.pry
    
      expect(sight[1][:id]).to eq(nil)
      expect(sight[1][:type]).to eq("tourist_sights")
      expect(sight[1][:attributes][:name]).to eq("Arch 22")
      expect(sight[1][:attributes][:address]).to eq("Arch 22, Independence Drive, Banjul City Council, The Gambia")
      expect(sight[1][:attributes][:place_id]).to eq("51f95a2a0e1e9530c059fb6cca91b0eb2a40f00102f9011e0a3d0f0000000092030741726368203232")
    end
  end
end