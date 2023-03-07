require 'rails_helper'

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_uniqueness_of :user_api_key }
  end

  describe "relationships" do
    it { should have_many :favorites}
  end

  describe "class method" do
    describe "#create_api_key" do
      it "creates a users api key when user is created" do
        user = User.new(name: "Milo", email: "milolittle@gmail.com")
        expect(user.user_api_key).to eq(nil)
        user.save
        expect(user.user_api_key).to be_a(String)
      end
    end
  end 
end