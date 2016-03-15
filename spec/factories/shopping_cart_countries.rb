FactoryGirl.define do
  sequence :name do |n|
    "country_name#{n}"
  end

  factory :shopping_cart_country, :class => 'ShoppingCart::Country' do
    name
  end
end
