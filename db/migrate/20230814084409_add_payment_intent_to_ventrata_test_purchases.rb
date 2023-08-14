class AddPaymentIntentToVentrataTestPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :ventrata_test_purchases, :payment_intent, :json
  end
end
