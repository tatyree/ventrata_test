module VentrataTest
  class Purchase < ApplicationRecord
    validates :amount, :currency, :customer, presence: true
  end
end
