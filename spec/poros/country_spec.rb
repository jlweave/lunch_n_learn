require 'rails_helper'

RSpec.describe "Country Result Poro" do
  it "stores country data from a json response as attributes" do
    response = File.read('spec/fixtures/country_results.json')
    data = JSON.parse(response, symbolize_names: true)
    first = Country.new(data.first)
    last = Country.new(data.last)

    expect(first.name).to eq("Republic of the Gambia")
    expect(first.name).to be_a(String)
    expect(last.name).to eq("Republic of Cabo Verde")
    expect(last.name).to be_a(String)
  end
end