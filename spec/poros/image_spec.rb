require 'rails_helper'

RSpec.describe "Image Poros" do
  it 'stores image data from a json response as attributes' do
    response = File.read('spec/fixtures/images_results.json')
    data = JSON.parse(response, symbolize_names: true)
    first = Image.new(data.first)
    last = Image.new(data.last)

    expect(first.alt_tag).to eq("a group of young women walking down a street")
    expect(first.url).to eq("https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MTg0ODF8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3Nzk2MjI3MQ&ixlib=rb-4.0.3&q=80")
    expect(first.alt_tag).to be_a(String)
    expect(last.alt_tag).to eq("a man in a costume walking down a street")
    expect(last.url).to eq("https://images.unsplash.com/photo-1677916042905-533ef80dba7a?crop=entropy&cs=tinysrgb&fm=jpg&ixid=Mnw0MTg0ODF8MHwxfGFsbHwxMHx8fHx8fDJ8fDE2Nzc5NjIyNzE&ixlib=rb-4.0.3&q=80")
    expect(last.alt_tag).to be_a(String)
  end
end