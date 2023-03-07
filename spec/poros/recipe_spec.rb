require 'rails_helper'

RSpec.describe "Recipe Poros" do
  it 'stores Recipe data from a json response as attributes' do
    response = File.read('spec/fixtures/recipes_results.json')
    data = JSON.parse(response, symbolize_names: true)
    # require 'pry'; binding.pry
    # country = "Ireland"
    # first = Recipe.new(data.first)
    # last = Recipe.new(data.last)
  end
end
