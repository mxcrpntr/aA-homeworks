require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users/new (#new)" do
    it "renders the new template" do
      get new_user_url
      expect(response.body).to include("Sign Up!")
    end
  end

  describe "POST /users (#create)" do
    context "with invalid params" do
      it "validates the presence of the user's email" do
        should validate_presence_of(:email)
      end

      it "validates that the password is at least 6 characters long" do
        should validate_length_of(:password).is_at_least(6)
      end
    end

    context "with valid params" do
      it "redirects user to root page on success" do
        visits bands_url
      end
    end
  end
end
