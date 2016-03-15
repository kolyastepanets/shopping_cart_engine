require 'rails_helper'

module ShoppingCart
  RSpec.describe ApplicationHelper, type: :helper do
    let(:credit_card) { create(:shopping_cart_credit_card) }
    let!(:order) { create(:shopping_cart_order, credit_card: credit_card) }

    describe "#cc_years" do
      it "returns array of years" do
        expect(cc_years).to eq ["2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026"]
      end
    end

    describe "#cc_months" do
      it "returns array of months" do
        expect(cc_months).to eq ['01','02','03','04','05','06','07','08','09','10','11','12']
      end
    end

    describe "#hidden_number_card" do
      it "returns 4 last visible integers" do
        expect(hidden_number_card(order)).to eq "** ** ** 1234"
      end
    end

    describe "#month and year" do
      it "returns month and year" do
        expect(month_and_year(order)).to eq "1/2017"
      end
    end
  end
end
