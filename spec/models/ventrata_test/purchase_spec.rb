require 'rails_helper'

module VentrataTest
  RSpec.describe Purchase do
    let(:valid_attributes) {
      { amount: 1000, customer: 'bob@example.com', currency: 'USD' }
    }

    it { is_expected.to have_db_column(:amount).of_type(:integer) }
    it { is_expected.to have_db_column(:currency).of_type(:string) }
    it { is_expected.to have_db_column(:customer).of_type(:string) }
    it { is_expected.to have_db_column(:payment_intent).of_type(:json) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:currency) }
    it { is_expected.to validate_presence_of(:customer) }

    context '#get_stripe_payment_intent' do
      it 'calls Stripe::PaymentIntent.create' do
        expect(Stripe::PaymentIntent).to receive(:create).with(
          hash_including(amount: valid_attributes[:amount], currency: valid_attributes[:currency])
        )
        described_class.create(valid_attributes)
      end
    end

    context '#card_payment' do
      subject(:purchase) { described_class.create(valid_attributes) }
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

      it 'returns an object based on the Stripe response' do
        expect(purchase.stripe_card_payment).to eq(
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
          }
        )
      end
    end
  end
end
