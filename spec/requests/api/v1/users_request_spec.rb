require 'rails_helper'

RSpec.describe "Users API" do
  describe "Users Story 3 - User Registration" do
    it "creates a user with attributes and an api_key randomly generated" do

      body = { "name": "Milo", "email": "milolittle@gmail.com" }
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      post "/api/v1/users", headers: headers, params: JSON.generate(user: body)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to be_a(Hash)
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to have_key(:name)
      expect(result[:data][:attributes]).to have_key(:email)
      expect(result[:data][:attributes]).to have_key(:user_api_key)

      user = User.last

      expect(user.name).to eq("Milo")
      expect(user.email).to eq("milolittle@gmail.com")
      expect(user.user_api_key).to be_a(String)
    end

    it "returns an error if param is left out" do
      body = { "name": "", "email": "milolittle@gmail.com" }
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      post "/api/v1/users", headers: headers, params: JSON.generate(user: body)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
   
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      
      expect(parsed_response).to be_a(Hash)
      # expect(parsed_response[:errors]).to eq("Error! New User was not created!")
    end
  end
end