module VentrataTest
  class Api::PurchasesController < ApplicationController
    def create
      @api_purchase = Purchase.new(api_purchase_params)

      if @api_purchase.save
        render json: @api_purchase.stripe_card_payment, status: :created
      else
        render json: @api_purchase.errors, status: :unprocessable_entity
      end
    end

    private
      def api_purchase_params
        params.fetch(:api_purchase, {}).permit(:amount, :currency, :customer)
      end
  end
end
