# require 'rails_helper'

# feature 'user can buy book', %q{
#   in order to buy book
#   i need to fill in addresses,
#   delivery, credit card
# } do

#   given(:book) { create(:book) }
#   given(:book2) { create(:book) }

#   given!(:order_item) { create(:shopping_cart_order_item, product: book) }
#   given!(:order_item2) { create(:shopping_cart_order_item, product: book2) }

#   given!(:order) { create(:shopping_cart_order, order_items: [order_item, order_item2]) }

#   given(:country) { create(:shopping_cart_country) }
#   given!(:countries) { create_list(:shopping_cart_country, 2) }

#   given(:delivery) { create(:shopping_cart_delivery) }
#   given(:deliveries) { create_list(:shopping_cart_delivery, 2) }

#   scenario 'filling in order info' do
#     visit shopping_cart.root_path
#     byebug
#     save_and_open_page
#     click_on "CHECKOUT"

#     fill_in "order_billing_address_attributes_first_name", with: 'first_name'
#     fill_in "order_billing_address_attributes_last_name", with: 'last_name'
#     fill_in "order_billing_address_attributes_street", with: 'street'
#     fill_in "order_billing_address_attributes_city", with: 'city'
#     fill_in "order_billing_address_attributes_zip", with: 123
#     fill_in "order_billing_address_attributes_phone", with: 12345678
#     select "country_name5", :from => "order_billing_address_attributes_country_id"

#     fill_in "order_shipping_address_attributes_first_name", with: 'first_name'
#     fill_in "order_shipping_address_attributes_last_name", with: 'last_name'
#     fill_in "order_shipping_address_attributes_street", with: 'street'
#     fill_in "order_shipping_address_attributes_city", with: 'city'
#     fill_in "order_shipping_address_attributes_zip", with: 123123
#     fill_in "order_shipping_address_attributes_phone", with: 1231212123
#     select "country_name6", :from => "order_shipping_address_attributes_country_id"

#     click_on "SAVE AND CONTINUE"


#     choose('order_delivery_id_1', true)
#     click_on "SAVE AND CONTINUE"


#     fill_in "order_credit_card_attributes_number", with: 1234123412341234
#     select "12", :from => "order_credit_card_attributes_expiration_month"
#     select "2017", :from => "order_credit_card_attributes_expiration_year"
#     fill_in "order_credit_card_attributes_cvv", with: 123
#     click_on "SAVE AND CONTINUE"

#     click_on "PLACE ORDER"


#     expect(page).to have_link "GO BACK TO STORE"
#   end

# end