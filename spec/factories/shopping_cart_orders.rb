FactoryGirl.define do
  factory :shopping_cart_order, :class => 'ShoppingCart::Order' do
    total_price 10
    aasm_state "in_progress"

  end
end
