class CreateVentrataTestPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :ventrata_test_purchases do |t|
      t.integer :amount
      t.string :currency
      t.string :customer

      t.timestamps
    end
  end
end
