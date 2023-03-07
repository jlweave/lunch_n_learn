require 'rails_helper'

RSpec.describe 'Favorites API' do
  it "creates a favorite" do
    user = User.create(name: "Milo", email: "milolittle@gmail.com")
    body = {"user_api_key": user.user_api_key, "country": "Ireland", "recipe_link": "http://www.edamam.com/recipe/cheddar-colcannon-torte-97c47f3162d83a9da30673929bbf8f7a/ireland", "recipe_title": "Cheddar Colcannon Torte"}
    headers = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/favorites', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(201)
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response).to have_key(:success)
      expect(parsed_response[:success]).to eq("Favorite was added to user")
  end
end