require 'rails_helper'

module ShoppingCart
  RSpec.describe CheckoutController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    let(:book) { create(:book) }
    let(:book2) { create(:book) }

    let(:billing_address) { create(:shopping_cart_billing_address) }
    let(:shipping_address) { create(:shopping_cart_shipping_address) }

    let!(:order_item) { create(:shopping_cart_order_item, product: book) }
    let!(:order_item2) { create(:shopping_cart_order_item, product: book2) }

    let(:country) { create(:shopping_cart_country) }
    let!(:countries) { create_list(:shopping_cart_country, 2) }

    let(:delivery) { create(:shopping_cart_delivery) }
    let(:deliveries) { create_list(:shopping_cart_delivery, 2) }

    let(:credit_card) { create(:shopping_cart_credit_card) }

    let!(:order) { create(:shopping_cart_order,
                            order_items: [order_item, order_item2],
                            delivery: delivery,
                            credit_card: credit_card,
                            billing_address: billing_address,
                            shipping_address: shipping_address) }

    let!(:proccesing_order) { create(:shopping_cart_order, aasm_state: "in_processing") }

    before do
      session[:order_id] = order.id
    end

    describe "GET #show" do
      context "address" do
        it 'expect to assign countries' do
          get :show, id: :address
          expect(assigns(:countries)).not_to be_nil
        end

        it "render address" do
          get :show, id: :address
          expect(response).to render_template('address')
        end
      end

      context "delivery" do
        before do
          # get :show, id: :delivery
        end

        it 'expect to assign deliveries' do
          get :show, id: :delivery
          expect(assigns(:deliveries)).not_to be_nil
        end

        it "render delivery" do
          get :show, id: :delivery
          expect(response).to render_template('delivery')
        end
      end

      context "payment" do
        let(:order) { create(:shopping_cart_order,
                        order_items: [order_item, order_item2],
                        delivery: delivery) }

        before do
          get :show, id: :payment
        end

        it 'expect credit_card not to be nil' do
          expect(assigns(order.credit_card)).not_to be_nil
        end

        it "render payment" do
          expect(response.status).to render_template('payment')
        end
      end

      context "confirm" do
        before do
          get :show, id: :confirm
        end

        it 'expect assigns to order' do
          expect(assigns(:order)).to eq order
        end

        it "render confirm" do
          expect(response.status).to render_template('confirm')
        end
      end

    end

    describe "PATCH #update" do
      context "address" do
        it "updates addresses" do
          patch :update, id: :address, order: { :billing_address_attributes=>
                                                  {"first_name"=>"123", "last_name"=>"123",
                                                    "street"=>"123123", "city"=>"123123",
                                                    "zip"=>"12313", "phone"=>"12313",
                                                    "country_id"=>"1" },
                                                :shipping_address_attributes=>
                                                  {"first_name"=>"123", "last_name"=>"123",
                                                    "street"=>"123123", "city"=>"123123",
                                                    "zip"=>"12313", "phone"=>"12313",
                                                    "country_id"=>"1" }
                                              }

          expect(order.billing_address).to be_valid
        end
      end

      context "delivery" do
        it "updates delivery" do
          patch :update, id: :delivery, order: { delivery_id: delivery.id }
          expect(order.delivery).to be_valid
        end
      end

      context "payment" do
        it "updates credit_card" do
          patch :update, id: :payment, order: { :credit_card_attributes=>
                                                { "number" => "1234123412341234",
                                                "expiration_month" => "12",
                                                "expiration_year" => "2017",
                                                "cvv" => "123" }
                                              }
          expect(order.credit_card).to be_valid
        end
      end

      context "confirm" do
        it "changes state's order" do
          patch :update, id: :confirm
          expect(response).to redirect_to("/shopping_cart/checkout/wicked_finish")
        end
      end
    end
  end
end
