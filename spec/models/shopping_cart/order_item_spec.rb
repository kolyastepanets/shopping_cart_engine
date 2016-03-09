require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItem, type: :model do
    it do
      should validate_numericality_of(:quantity).
        is_greater_than_or_equal_to(1).
        only_integer
    end

    it { should belong_to(:product).class_name('Book') }
    it { should belong_to(:order) }


    let(:book) { create(:book) }
    let(:order_item) { create(:shopping_cart_order_item) }

    context "#unit_price" do
      it "has its price if it persists" do
        book = build(:book, price: 20)
        expect(book.price).to_not eq order_item.unit_price
      end

      it "has books price if created" do
        expect(book.price).to eq order_item.unit_price
      end
    end

    context "#total_price" do
      it "counts total price" do
        expect(order_item.total_price).to eq (order_item.price * order_item.quantity)
      end
    end
  end
end
