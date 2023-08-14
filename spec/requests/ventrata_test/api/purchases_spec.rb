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
        let(:amount) { valid_attributes[:amount] }
        let(:clientSecret) { 'p_1GG1qyCgIN4MRzgjHrJygury_secret_PW4yD18qsNpU1Gz8etftPCZDM' }
        let(:currency) { valid_attributes[:currency] }
        let(:id) { 'pi_1GG1qyCgIN4MRzgjHrJygury' }
        let(:publishableKey) { 'pk_test_f2FFE5An5Z0oMyxjlYgFRtdO' }

        before do
          expect(Stripe::PaymentIntent).to receive(:create).and_return(
            {
              id: id,
              publishableKey: publishableKey,
              clientSecret: clientSecret,
              amount: amount,
              currency: currency,
            }
          )
        end

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

        # This is not as DRY as I would like it to be given the model test. My thinking here is that this and the model
        # unit test would be combined into a single swagger spec using the Rswag gem. Making Rswag play nicely with the
        # namespaced routes proved to be a little more effort than I had time for under the circumstances.
        it "renders a JSON response according to https://docs.ventrata.com/capabilities/card-payments#stripe-gateway" do
          post ventrata_test.api_purchases_url,
            params: { api_purchase: valid_attributes }, headers: valid_headers, as: :json
          expect(response.body).to eq(
            {
              gateway: "stripe",
              stripe: {
                version: "latest",
                paymentIntent: {
                  id: ,
                  publishableKey:,
                  clientSecret:,
                  amount:,
                  currency:,
                }
              }
            }.to_json
          )
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
