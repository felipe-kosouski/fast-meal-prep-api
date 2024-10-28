require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:user) { create(:user) }

    it "returns http success" do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it "returns 404 for non-existent user" do
      get "/users/999999"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { { first_name: "John", last_name: "Doe", email: "john.doe@example.com", password: "password", password_confirmation: "password" } }
    let(:invalid_attributes) { { first_name: "", last_name: "", email: "john.doe@example.com", password: "password", password_confirmation: "password" } }

    it "creates a new user with valid attributes" do
      post "/users", params: valid_attributes
      expect(response).to have_http_status(:created)
    end

    it "does not create a new user with invalid attributes" do
      post "/users", params: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /update" do
    let(:user) { create(:user) }
    let(:valid_attributes) { { first_name: "Jane", last_name: "Doe", email: "jane.doe@example.com" } }
    let(:invalid_attributes) { { first_name: "", last_name: "", email: "jane.doe@example.com" } }

    it "updates the user with valid attributes" do
      put "/users/#{user.id}", params: valid_attributes
      expect(response).to have_http_status(:ok)
    end

    it "does not update the user with invalid attributes" do
      put "/users/#{user.id}", params: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /destroy" do
    let(:user) { create(:user) }

    it "deletes the user" do
      delete "/users/#{user.id}"
      expect(response).to have_http_status(:ok)
    end

    it "returns 404 for non-existent user" do
      delete "/users/999999"
      expect(response).to have_http_status(:not_found)
    end
  end
end
