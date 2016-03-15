require 'rails_helper'

module ShoppingCart
  RSpec.describe OrderItemsController, type: :controller do
    routes { ShoppingCart::Engine.routes }

    let(:book) { create(:book) }
    let(:book2) { create(:book) }
    let!(:order_item) { create(:shopping_cart_order_item, product: book) }
    let!(:order_item2) { create(:shopping_cart_order_item, product: book2) }
    let!(:order) { create(:shopping_cart_order) }


    describe 'POST #create' do
      it 'assigns order to @order' do
        post :create, book_id: book
        expect(assigns(:order)).to_not be_nil
      end

      it 'gets #add_product' do
        order.add_product(book, 1)
        expect(order.order_items).to_not be_empty
      end

      it 'redirects to cart_path' do
        post :create, book_id: book
        expect(response).to redirect_to cart_path
      end
    end

    describe 'DELETE #destroy' do
      let!(:order) { create(:shopping_cart_order, order_items: [order_item, order_item2]) }

      before do
        session[:order_id] = order.id
      end

      context "deletes order_item" do
        it 'deletes order' do
          expect { delete :destroy, order_id: order, id: order_item }.to change(OrderItem, :count).by(-1)
        end

        it 'redirect to book path' do
          delete :destroy, order_id: order, id: order_item
          expect(response).to redirect_to cart_path
        end
      end
    end
  end
end
