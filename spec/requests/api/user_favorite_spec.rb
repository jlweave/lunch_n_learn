require 'rails_helper' 

RSpec.describe 'Get user favorites' do
  it 'should return all recipes that a user favorited' do
    user1 = create(:user)
    recipe1 = create(:favorite, user_id: user1.id, user_api_key: user1.user_api_key)
    recipe2 = create(:favorite, user_id: user1.id, user_api_key: user1.user_api_key)
    recipe3 = create(:favorite, user_id: user1.id, user_api_key: user1.user_api_key)
  
    get "/api/v1/favorites?user_api_key=#{user1.user_api_key}"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    response_body = JSON.parse(response.body, symbolize_names: true)
    u_fav = response_body[:data]
    
    expect(u_fav.count).to eq(3)
    expect(u_fav).to be_an(Array)
      expect(u_fav[0]).to have_key(:id)
      expect(u_fav[0]).to have_key(:type)
      expect(u_fav[0][:type]).to eq("favorites")
      expect(u_fav[0]).to have_key(:attributes)
      expect(u_fav[0][:attributes]).to have_key(:country)
      # expect(u_fav[0][:attributes][:country]).to eq("Turkmenistan")
      expect(u_fav[0][:attributes]).to have_key(:recipe_link)
      # expect(u_fav[0][:attributes][:recipe_link]).to eq("http://kohler-marquardt.name/marcelino.armstrong")
      expect(u_fav[0][:attributes]).to have_key(:recipe_title)
      # expect(u_fav[0][:attributes][:recipe_title]).to have_key("Et animi harum veritatis.")
      expect(u_fav[0][:attributes]).to_not have_key(:user_api_key) 
  end

  it 'returns no recipes if the user has no favorites' do
    body = { "name": "Milo", "email": "milolittle@gmail.com" }
    headers = { "Content-Type": "application/json", Accept: "application/json" }
    post "/api/v1/users", headers: headers, params: JSON.generate(user: body)
    @user = User.last

    body2 = {"user_api_key": "#{@user.user_api_key}", "country": "Ireland", "recipe_link": "http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland", "recipe_title": "East of Ireland Recipe"}
    headers2 = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/favorites', headers: headers2, params: JSON.generate(favorite: body2)

    get "/api/v1/favorites?user_api_key=#{@user.user_api_key}"
    
    expect(response).to be_successful
    recipe = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(recipe).to eq([])
  end

  it 'returns an error if it is not a valid api_key' do
    body = { "name": "Milo", "email": "milolittle@gmail.com" }
    headers = { "Content-Type": "application/json", Accept: "application/json" }
    post "/api/v1/users", headers: headers, params: JSON.generate(user: body)
    @user = User.last

    body2 = {"user_api_key": "#{@user.user_api_key}", "country": "Ireland", "recipe_link": "http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland", "recipe_title": "East of Ireland Recipe"}
    headers2 = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/favorites', headers: headers2, params: JSON.generate(favorite: body2)

    get "/api/v1/favorites?api_key=1546sdg546dsh7"

    expect(response).to have_http_status(400)
    expect(response.body).to eq("{\"errors\":\"User could not be found, try again.\"}")
  end
end
