require 'rails_helper'

module VentrataTest
  RSpec.describe "/api/purchases", type: :request do
    let(:valid_attributes) {
      { amount: 1000, customer: 'bob@example.com', currency: 'USD' }
    }

    let(:invalid_attributes) {
      { amount: nil, customer: nil, currency: nil }
    }

    let(:valid_headers) {
      {}
    }

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Purchase" do
          expect {
            post ventrata_test.api_purchases_url,
                 params: { api_purchase: valid_attributes }, headers: valid_headers, as: :json
          }.to change(Purchase, :count).by(1)
        end

        it "renders a JSON response with the new api_purchase" do
          post ventrata_test.api_purchases_url,
               params: { api_purchase: valid_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:created)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Purchase" do
          expect {
            post ventrata_test.api_purchases_url,
                 params: { api_purchase: invalid_attributes }, as: :json
          }.not_to change(Purchase, :count)
        end

        it "renders a JSON response with errors for the new api_purchase" do
          post ventrata_test.api_purchases_url,
               params: { api_purchase: invalid_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end
  end
end
