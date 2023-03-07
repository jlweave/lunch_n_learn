require 'rails_helper'

RSpec.describe "Images Service" do
  it "renders webmock" do
    json_response = File.read('spec/fixtures/images_results.json')

    stub_request(:get, "https://api.unsplash.com/photos?client_id=FoU21Aof3IdX1GgTPqvvN-xVv5ovtlWH5se3rNK0mTo&order_by=relevant&page=1&per_page=10&query=Ireland")
      .to_return(status: 200, body: json_response, headers: {})

    country = "Ireland"
    result = ImagesService.find_country_images(country)
   
    expect(result[0][:alt_description]).to eq("a group of young women walking down a street")
    expect(result[0][:alt_description]).to be_a(String)
    expect(result[0][:urls][:full]).to eq("https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MTg0ODF8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3Nzk2MjI3MQ&ixlib=rb-4.0.3&q=80")
    expect(result[0][:urls][:full]).to be_a(String)
  end
end
