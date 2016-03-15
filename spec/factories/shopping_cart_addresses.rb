FactoryGirl.define do
  factory :shopping_cart_address, :class => 'ShoppingCart::Address' do
    first_name "first_name_address"
    last_name "last_name_address"
    street "street"
    city "city"
    zip 1
    phone 1
    country_id 1

    factory :shopping_cart_billing_address, class: 'ShoppingCart::BillingAddress' do
      association :addressable, factory: :shopping_cart_address
    end

    factory :shopping_cart_shipping_address, class: 'ShoppingCart::ShippingAddress' do
      association :addressable, factory: :shopping_cart_address
    end
  end

end
