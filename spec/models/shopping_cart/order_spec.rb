require 'rails_helper'

module ShoppingCart
  RSpec.describe Order, type: :model do
    it { should validate_presence_of(:aasm_state) }
    # it { should validate_presence_of(:completed_date) }

    it { should belong_to(:user) }
    it { should belong_to(:coupon) }
    it { should belong_to(:delivery) }

    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_one(:credit_card) }


    let(:order) { create(:shopping_cart_order) }
    let(:book1) { create(:book) }
    let(:book2) { create(:book, price: 100) }
    let!(:order_item) { create(:shopping_cart_order_item) }
    let!(:order_item2) { create(:shopping_cart_order_item) }

    context "#total_price" do
      let(:order) { create(:shopping_cart_order, order_items: [order_item, order_item2]) }

      it "counts total price" do
        expect(order.total_price).to eq (20)
      end
    end

    context "#total_quantity" do
      let(:order) { create(:shopping_cart_order, order_items: [order_item, order_item2]) }

      it "counts all items in cart" do
        expect(order.total_quantity).to eq (2)
      end
    end

    context "#build_both_addresses" do
      it "receives both merhods" do
        order.billing_address = nil
        order.shipping_address = nil
        expect(order).to receive(:building_shipping_address)
        expect(order).to receive(:building_billing_address)
        order.build_both_addresses
      end

      it "does not receive methods if persists" do
        order.build_both_addresses
        expect(order).to_not receive(:building_shipping_address)
        expect(order).to_not receive(:building_billing_address)
      end
    end

    context "#building_credit_card" do
      it "builds credit card" do
        order.credit_card = nil
        expect(order).to receive(:building_credit_card)
        order.building_credit_card
      end
    end

    context "#add_book" do
      let(:order_item) { create(:shopping_cart_order_item, order: order) }

      it "increases quantity if order_item exist" do
        order.add_product(order_item.product, 1)
        order_item.reload
        expect(order_item.quantity).to eq(2)
      end

      it "creates new order item" do
        order = create(:shopping_cart_order, order_items: [order_item, order_item2])
        expect(order.order_items.size).to eq 2
      end
    end

    context "#update_total_price" do
      it "updates total price before save" do
        order = build(:shopping_cart_order)
        expect(order).to receive(:update_total_price)
        order.save
      end
    end
  end
end
