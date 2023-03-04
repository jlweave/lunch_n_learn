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

    json_response2 = File.read('spec/fixtures/images_results.json')

    query2 = "Ireland"

    image_key = ENV['image_api_key']
    # https://api.unsplash.com/photos?query=Ireland

    stub_request(:get, "https://api.unsplash.com/photos?client_id=#{image_key}&page=1&per_page=10&order_by=relevant&query=#{query2}")
      .to_return(status: 200, body: json_response2, headers: {})

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
    expect(result[:attributes]).to have_key(:image)
  end
end