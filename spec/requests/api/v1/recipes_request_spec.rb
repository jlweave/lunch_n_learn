require 'rails_helper'

RSpec.describe "Recipe API" do
   before(:each) do
    json_response = File.read('spec/fixtures/recipes_results.json')

    query = "Ireland"

    api_key = ENV['recipe_api_key']
    api_id = ENV['recipe_api_id']

    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{api_id}&app_key=#{api_key}&q=#{query}&type=public")
         .to_return(status: 200, body: json_response, headers: {})

   end

  it "sends a list of recipes based on country" do
    get "/api/v1/recipes?q=Ireland"

    expect(response).to be_successful
    json_result = JSON.parse(response.body, symbolize_names: true)

    recipes = json_result[:data]
   
    expect(recipes.first).to have_key(:id)
    expect(recipes.first[:id]).to eq(nil)

    expect(recipes.first).to have_key(:type)
    expect(recipes.first[:type]).to eq("recipes")

    expect(recipes.first[:attributes]).to have_key(:title)
    expect(recipes.first[:attributes][:title]).to eq("East of Ireland Recipe")
    expect(recipes.first[:attributes][:title]).to be_a(String)
   
    expect(recipes.first[:attributes]).to have_key(:url)
    expect(recipes.first[:attributes][:url]).to eq("http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland")
    expect(recipes.first[:attributes][:url]).to be_a(String)
   
    expect(recipes.first[:attributes]).to have_key(:image_url)
    expect(recipes.first[:attributes][:image_url]).to be_a(String)

    expect(recipes.first[:attributes][:country]).to eq("Ireland")
    expect(recipes.first[:attributes][:country]).to be_a(String)

    expect(recipes.first).to_not have_key(:title)
    expect(recipes.first).to_not have_key(:url)
    expect(recipes.first).to_not have_key(:image_url)
    expect(recipes.first[:attributes][:country]).to_not eq("Thailand")
  end
end