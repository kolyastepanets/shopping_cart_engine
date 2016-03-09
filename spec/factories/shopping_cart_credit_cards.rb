FactoryGirl.define do
  factory :shopping_cart_credit_card, :class => 'ShoppingCart::CreditCard' do
    number 1234123412341234
    cvv 123
    expiration_month 1
    expiration_year 2017

    trait :invalid do
      number nil
      cvv nil
      expiration_month nil
      expiration_year nil
    end
  end
end
