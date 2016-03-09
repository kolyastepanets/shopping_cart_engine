FactoryGirl.define do
  factory :shopping_cart_order_item, :class => 'ShoppingCart::OrderItem' do
    price 9.99
    quantity 1
    book
    # order

    trait :invalid do
      quantity nil
      price nil
    end
  end

end
