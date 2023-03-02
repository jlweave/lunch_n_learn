require 'rails_helper'

RSpec.describe "Recipe API" do
  it "sends a list of recipes based on country" do
    country = "Thialand"

    get "/api/v1/recipes?q=#{country}"

    expect(response).to be_successful
    
  end
end