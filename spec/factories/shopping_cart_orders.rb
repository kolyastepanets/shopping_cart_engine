FactoryGirl.define do
  factory :shopping_cart_order, class: 'ShoppingCart::Order' do
    aasm_state "in_progress"
    completed_date "2016-03-10"
    delivery_id 1
    coupon_id 1
    total_price "9.99"
  end
end
