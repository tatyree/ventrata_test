require 'rails_helper'

module VentrataTest
  RSpec.describe Purchase do
    it { is_expected.to have_db_column(:amount).of_type(:integer) }
    it { is_expected.to have_db_column(:currency).of_type(:string) }
    it { is_expected.to have_db_column(:customer).of_type(:string) }
  end
end
