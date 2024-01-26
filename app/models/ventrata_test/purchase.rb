module VentrataTest
  class Purchase < ApplicationRecord
    validates :amount, :currency, :customer, presence: true

    after_create :get_stripe_payment_intent

    def stripe_card_payment
      {
        gateway: "stripe",
        stripe: {
          version: "latest",
          paymentIntent: {
            id: payment_intent['id'],
            publishableKey: payment_intent['publishableKey'],
            clientSecret: payment_intent['clientSecret'],
            amount: payment_intent['amount'],
            currency: payment_intent['currency'],
          }
        }
      }

    end

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
