require 'rails_helper'

RSpec.describe "Country Service" do
  it "renders webmock" do
    json_response = File.read('spec/fixtures/country_results.json')

    stub_request(:get, "https://restcountries.com/v3.1/all")
    .to_return(status: 200, body: json_response, headers: {})

    result = CountryService.find_all_countries
    
    expect(result).to eq(JSON.parse(json_response, symbolize_names: true))
    expect(result[0][:name][:official]).to eq("Republic of the Gambia")
    expect(result[0][:name][:official]).to be_a(String)
  end
end