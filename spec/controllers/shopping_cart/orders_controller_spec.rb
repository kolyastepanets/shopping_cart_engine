require 'rails_helper'

module ShoppingCart
  RSpec.describe OrdersController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    let!(:user) { create(:user) }
    let!(:order) { create(:shopping_cart_order, user: user) }
    let!(:delivered_orders) { create_list(:shopping_cart_order, 2, user: user, aasm_state: "delivered") }
    let!(:in_delivery_orders) { create_list(:shopping_cart_order, 2, user: user, aasm_state: "in_delivery") }
    let!(:in_processing_orders) { create_list(:shopping_cart_order, 2, user: user, aasm_state: "in_processing") }

    before { allow(controller).to receive(:current_user).and_return(user) }
    before { allow(controller).to receive(:current_user_order).and_return(order) }

    describe 'GET #index' do
      sign_in_user
      before { get :index }

      it 'returns current order' do
        expect(assigns(:current_order)).to eq order
      end

      it 'has array of processing orders' do
        expect(assigns(:in_processing)).to eq in_processing_orders
      end

      it 'has array of in delivery orders' do
        expect(assigns(:in_delivery)).to eq in_delivery_orders
      end

      it 'has array of delivered orders' do
        # binding.pry
        expect(assigns(:delivered)).to eq delivered_orders
      end

      it 'render index' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      sign_in_user
      before { get :show, id: order, user: user }

      it 'assigns order to @order' do
        expect(assigns(:order)).to eq order
      end

      it 'renders show view' do
        expect(response).to render_template :show
      end
    end
  end
end
