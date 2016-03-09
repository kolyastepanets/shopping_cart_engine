require 'rails_helper'

module ShoppingCart
  RSpec.describe Coupon, type: :model do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:discount) }
    it { should validate_numericality_of(:discount).
          is_greater_than_or_equal_to(0).
          is_less_than_or_equal_to(90) }

    it { should have_one(:order) }
  end
end
