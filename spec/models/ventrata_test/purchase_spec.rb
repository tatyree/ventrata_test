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
  end
end
