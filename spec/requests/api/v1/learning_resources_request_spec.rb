require "rails_helper"

RSpec.describe "Learning Resources API" do
  before (:each) do
    json_response = File.read('spec/fixtures/learning_resources_results.json')

    query = "Ireland"

    api_key = ENV['google_api_key']

stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{api_key}&maxResults=1&part=snippet&q=#{query}")
        .to_return(status: 200, body: json_response, headers: {})
    # stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{api_key}&part=snippet&q=#{query}&type=video")
    #      .to_return(status: 200, body: json_response, headers: {})
  end
  it "can find learning resources for a particular country" do
    get "/api/v1/learning_resources?q=Ireland"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  
    expect(result).to have_key(:id)
    expect(result[:id]).to eq(nil)

    expect(result).to have_key(:type)
    expect(result[:type]).to eq("learning_resources")

    expect(result).to have_key(:attributes)
    expect(result[:attributes]).to have_key(:country)
    expect(result[:attributes][:country]).to eq("Ireland")
    expect(result[:attributes]).to have_key(:video)
  end
end