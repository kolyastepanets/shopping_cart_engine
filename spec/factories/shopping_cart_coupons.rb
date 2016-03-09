FactoryGirl.define do
  factory :shopping_cart_coupon, :class => 'ShoppingCart::Coupon' do
    name "blackfriday"
    discount 20
    order { create(:shopping_cart_order) }
  end
end
