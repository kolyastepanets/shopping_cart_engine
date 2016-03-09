require 'rails_helper'

module ShoppingCart
  RSpec.describe Delivery, type: :model do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }

    it { should validate_numericality_of(:price) }

    it { should have_many(:orders) }
  end
end
