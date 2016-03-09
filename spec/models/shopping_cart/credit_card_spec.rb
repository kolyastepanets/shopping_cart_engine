require 'rails_helper'

module ShoppingCart
  RSpec.describe CreditCard, type: :model do
    it { should validate_presence_of(:cvv) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:expiration_year) }
    it { should validate_presence_of(:expiration_month) }

    it { should validate_numericality_of(:cvv) }
    it { should validate_numericality_of(:number) }
    it { should validate_numericality_of(:expiration_month) }

    it { should validate_numericality_of(:expiration_year).is_greater_than_or_equal_to(2016) }


    let(:credit_card) { create(:shopping_cart_credit_card) }

    it "validates length of cvv" do
      expect(credit_card.cvv.to_s.size).to eq 3
    end

    it "validates length of number" do
      expect(credit_card.number.to_s.size).to eq 16
    end

    it { should belong_to(:order) }

  end
end
