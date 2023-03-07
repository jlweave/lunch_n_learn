require 'rails_helper'

RSpec.describe "Recipe Service" do
  it "renders webmock" do
    json_response = File.read('spec/fixtures/recipes_results.json')
    
    country = "Ireland"

    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=f446f1f7&app_key=80a72fa7c90888e68ee4e557762bcf77&q=Ireland&type=public")
         .to_return(status: 200, body: json_response, headers: {})

    result = RecipesService.find_recipes(country)

    expect(result[:hits][0][:recipe][:label]).to be_a(String)
    expect(result[:hits][0][:recipe][:label]).to eq("East of Ireland Recipe")
    expect(result[:hits][0][:recipe][:shareAs]).to be_a(String)
    expect(result[:hits][0][:recipe][:shareAs]).to eq("http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland")
    expect(result[:hits][0][:recipe][:image]).to be_a(String)
  end
end
