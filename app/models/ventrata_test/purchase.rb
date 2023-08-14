module VentrataTest
  class Purchase < ApplicationRecord
    validates :amount, :currency, :customer, presence: true

    after_create :get_stripe_payment_intent

    private

    def get_stripe_payment_intent
      payment_intent = Stripe::PaymentIntent.create({
        amount:,
        currency:,
        payment_method_types: ['card'],
      })

      update(payment_intent:)
    end
  end
end
