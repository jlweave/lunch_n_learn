require 'rails_helper'

RSpec.describe "Learning Resource Poros" do
  it "stores learning resources data from a json response as attributes" do
    response = File.read('spec/fixtures/learning_resources_results.json')
    data = JSON.parse(response, symbolize_names: true)

  end
end